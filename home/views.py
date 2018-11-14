import datetime
from datetime import date
from io import BytesIO
import os, logging
from PIL import Image as PIL_Image

from django.shortcuts import render
from django.views.generic import TemplateView
from django.views.generic.list import ListView
from django.views.generic.detail import DetailView
from django.views.generic.edit import FormView
from django.http import HttpResponseRedirect, JsonResponse
from django.db.models import Q
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from django.utils import timezone
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator
from django.core.exceptions import NON_FIELD_ERRORS

from sae.extend.SinaSCS import sinastorage
from sae.extend.SinaSCS.sinastorage.bucket import SCSBucket,ACL, SCSError, KeyNotFound, BadRequest

from sae.basic.models import User, Image, LoginRecord, InternalMessage, UnreadGroupMessage, ImageRecognitionSequene
from sae.basic.utils import Util
from sae import settings
from .forms import FileFieldForm
from sae.basic.validators import UploadFileValidator

logger = logging.getLogger('django')
THUMBNAIL_WIDTH = 32
THUMBNAIL_HEIGHT = 32

class MessageDetailView(DetailView):
	template_name = 'home_message.html'
	util = Util()

	def get(self, request, *args, **kwargs):
		message = None
		from_user_full_name = ''
		if 'message_id' in self.kwargs.keys():
			message_id = int( self.kwargs['message_id'] )
			if 0 < message_id:
				try:
					message = InternalMessage.objects.filter(
						status__gt=0,status__lt=4
					).only("send_time", "from_user", "message_title", "message_body", "message_id").get(message_id=message_id)
					user = self.util.getUser(request)
				except InternalMessage.DoesNotExist:
					message = None
				
				if message and user:
					try:
						unread = UnreadGroupMessage.objects.filter(message=message, user=user)
					except UnreadGroupMessage.DoesNotExist:
						unread = None
					if unread is not None:
						unread.delete()
				if message:
					if 1 == int(message.status):
						message.status = 2
						message.read_time = timezone.now()
						message.save()
					from_user_full_name = self.util.getUserFullName( request, user=None, user_id=int(message.from_user.pk) )
		variables = {
			'page_title': _('message detail'),
			'message': message,
			'from_user_full_name': from_user_full_name,
			'tzname': self.util.getTimezone( request ),
			'error_msg': _('cannot find this message') if message is None else ''
		}
		return render( request, self.template_name, variables )

class MessageListView(ListView):
	template_name = 'home_messages.html'
	util = Util()

	def get(self, request, *args, **kwargs):
		userid = self.util.getUserId(request = request)
		user = self.util.getUser(request, userid)
		messages = None
		if user is not None:
			# view messages
			messagesToThisUser = InternalMessage.objects.filter(
				Q(to_user_id__isnull=True) | Q(to_user_id__lt=1) |
				( Q(to_user_id__exact=userid) & Q(status__gt=0) & Q(status__lt=4) )
			).order_by('-send_time').only('message_id','message_body','send_time','status','message_title')
			messagesForTest = InternalMessage.objects.filter(
				( Q(to_user_id__exact=userid) & Q(status__gt=0) & Q(status__lt=4) )
			).order_by('-send_time').only('message_id','message_body','send_time','status','message_title')
			print(messagesForTest)
			for x in messagesForTest:
				print(x.pk, x.message_title, x.status)
			paginator = Paginator(messagesToThisUser, settings.PER_PAGE, settings.ORPHANS, settings.ALLOW_EMPTY_FIRST_PAGE)
			page = request.GET.get('page')
			messages = paginator.get_page(page)

			body_length = settings.MESSAGE_BODY_LENGTH
			# view unread message_ids
			unreadMessagesFromSystem = UnreadGroupMessage.objects.filter(user__exact=user,).only('message')
			unreadIds = []
			for oneUnread in unreadMessagesFromSystem:
				unreadIds += [ int(oneUnread.message_id) ]
			
			for oneMessage in messages:
				if oneMessage.group is not None and 1 > int(oneMessage.to_user_id):
					if oneMessage.pk in unreadIds:
						oneMessage.status = 1
					else:
						oneMessage.status = 2 # currently there is no status equaling to 0 or 3
				oneMessage.message_body = oneMessage.message_body[0:body_length]
				oneMessage.message_title = oneMessage.message_title[0:body_length]
				if date.today() != oneMessage.send_time.date():
					oneMessage.send_time = oneMessage.send_time.date()
		variables = {
			'page_title': _('messages'),
			'messages': messages,
			'tzname': self.util.getTimezone( request ),
		}
		return render(request, self.template_name, variables)

class HomeView(ListView):
	template_name = 'home_index.html'
	util = Util()

	def get(self, request, *args, **kwargs):
		userid = self.util.getUserId(request = request)
		user = self.util.getUser( request, userid)
		pagenum = 1
		if 'pagenum' in self.kwargs.keys() and self.kwargs['pagenum'] is not None and 1 < int( self.kwargs['pagenum'] ):
			pagenum = int( self.kwargs['pagenum'] )
		
		# check if just logined
		if request.session.has_key( 'just_visit_login' ) and request.session['just_visit_login']:
			del request.session['just_visit_login']
			ip = self.util.getRemoteAddress( request )
			if '' != ip and user is not None:
				LoginRecord.objects.create(user=user, login_ip=ip)
		
		# this user's own images
		this_user_images = Image.objects.filter(user=user).order_by('-upload_time').only('recognized','file_path','upload_time','image_id','user_label')
		paginator = Paginator(this_user_images, settings.PER_PAGE, settings.ORPHANS, settings.ALLOW_EMPTY_FIRST_PAGE)
		page = request.GET.get('page')
		if page is None:
			page = pagenum
		images = paginator.get_page(page)

		variables = {
			'page_title': _('home'),
			'unread': self.util.getUnreadMessageNumber(user),
			'images': images,
			'tzname': self.util.getTimezone( request ),
			'activetab': 1,
			'user_full_name': user.get_full_name(),
		}
		return render(request, self.template_name, variables)

class ImageDetailView(DetailView):
	template_name = 'home_detail.html'
	util = Util()

	def get(self, request, *args, **kwargs):
		image = None
		goto = 1 # 1 == from home_index.html; 2 == from index_index.html
		pagenum = 1
		if 'goto' in self.kwargs.keys() and 1 != int( self.kwargs['goto'] ):
			goto = int( self.kwargs['goto'] )
		if 'pagenum' in self.kwargs.keys() and self.kwargs['pagenum'] is not None and 1 < int( self.kwargs['pagenum'] ):
			pagenum = int( self.kwargs['pagenum'] )
		variables = {
			'page_title': _('image detail'),
			'image': image,
			'error_msg': '',
			'tzname': self.util.getTimezone( request ),
			'goto': goto,
			'pagenum': pagenum,
		}
		if 'image_id' in self.kwargs.keys():
			image_id = int( self.kwargs['image_id'] )
			if 0 < image_id:
				if 1 == goto:
					# goto == 1, from home page view user's own images
					userid = self.util.getUserId(request = request)
					user = self.util.getUser( request, userid)
					try:
						image = Image.objects.filter(
							user__exact=user,
						).only("image_id", "upload_time", "file_path", "recognized","user_label",).get(image_id=image_id)
					except Image.DoesNotExist:
						message = 'inside get method in sae.sae.home.views.ImageDetailView\r\n'
						message += 'Image.DoesNotExist: image_id = ' + str(image_id) + ' and userid = ' + str(userid)
						logger.error(message)
						variables['error_msg'] = _('Please login first.')
						image = None
					else:
						variables['image'] = image
				else:
					# goto == 2, from index page view admin's images
					is_staff = False
					is_superuser = False
					try:
						image = Image.objects.only("user", "image_id", "upload_time", "file_path", "recognized","user_label",).get(image_id=image_id)
						is_staff = image.user.is_staff
						is_superuser = image.user.is_superuser
					except Image.DoesNotExist:
						message = 'inside get method in sae.sae.home.views.ImageDetailView\r\n'
						message += 'Image.DoesNotExist: image_id = ' + str(image_id)
						logger.error(message)
						variables['error_msg'] = _('cannot find this image.')
						image = None
					else:
						if not is_superuser and not is_staff:
							image = None
						variables['image'] = image
			else:
				variables['error_msg'] = _('Please provide the image_id.')
		else:
			variables['error_msg'] = _('Please provide the image_id.')
		return render( request, self.template_name, variables )

class SettingsView(TemplateView):
	template_name = 'home_settings.html'

	def get(self, request, *args, **kwargs):
		userid = Util.getUserId(Util, request)
		user = Util.getUser(Util, request, userid)
		variables = {
			'page_title': _('settings'),
			'unread': Util.getUnreadMessageNumber(Util, user),
			'activetab': 3,
		}
		return render(request, self.template_name, variables)
		

class UploadView(FormView):
	template_name = 'home_upload.html'
	form_class = FileFieldForm
	success_url = '/home/'
	model = Image
	# acl = {
	# 	ACL.ACL_GROUP_ANONYMOUSE:[ACL.ACL_READ],
	# 	ACL.ACL_GROUP_CANONICAL:[ACL.ACL_READ], # ACL.ACL_READ_ACP,ACL.ACL_WRITE_ACP
	# }
	acl = 'public-read' # 'private', 'public-read-write', 'authenticated-read'
	# get it from PHP code
	util = Util()
	bucket = None
	upload_file = None
	sina_scs_prefix = ''
	max_upload_file_size = 5242880
	waiting_path = os.path.join( settings.BASE_DIR, 'recognition/images_waiting/' )

	def get(self, request, *args, **kwargs):
		userid = self.util.getUserId(request = request)
		user = self.util.getUser( request, userid)
		form_class = self.get_form_class()
		form = self.get_form(form_class)
		variables = {
			'page_title': _('upload an image'),
			'unread': self.util.getUnreadMessageNumber(user),
			'activetab': 2,
			'form': form,
			'max_upload_file_size': str( round(self.max_upload_file_size/1048576) ) + ' MB',
		}
		return render(request, self.template_name, variables)

	def post(self, request, *args, **kwargs):
		form_class = self.get_form_class()
		form = self.get_form(form_class)
		variables = {
			'page_title': _('upload an image'),
			'form': form,
			'activetab': 2,
			'max_upload_file_size': str( round(self.max_upload_file_size/1048576) ) + ' MB',
		}
		# new_id = 0
		if form.is_valid():
			# check session to avoid multiple uploads
			# do not place this validation in forms.py because it is difficult to reach request in FileFieldForm
			validatorObj = UploadFileValidator(request)
			temp = validatorObj.check_multiple_form_submit()
			if '' != temp:
				form.add_error(NON_FIELD_ERRORS, temp )
				# variables['form'] = form # after testing, there is no need for this
				return render(request, self.template_name, variables)
			
			# check file size
			temp = validatorObj.check_file_size(self.max_upload_file_size)
			if '' != temp:
				form.add_error(NON_FIELD_ERRORS, temp )
				return render(request, self.template_name, variables)

			file = request.FILES['file']
			request.session['just_uploaded'] = file.name

			# write file to Sina SCS
			userid = self.util.getUserId(request = request)
			now_microtime = datetime.datetime.now().strftime('%Y%m%d_%H%M%S_%f')
			ext = self.util.getImageFileNameExtension( file.name )
			filename = 'u' + str(userid) + 't' + now_microtime +'.' + ext
			if '127.0.0.1' == Util.getRemoteAddress(Util, request):
				self.sina_scs_prefix = 'test/'
			else:
				self.sina_scs_prefix = 'pocket/'
			sinastorage.setDefaultAppInfo( settings.SINA_SCS_ACCESS_KEY, settings.SINA_SCS_SECRET_KEY )
			bucket = sinastorage.bucket.SCSBucket( settings.SINA_SCS_BUCKET_NAME, secure=True) # use https
			self.bucket = bucket
			self.upload_file = file
			scsResponse = bucket.put( self.sina_scs_prefix + filename, file.read(), self.acl )
			sinaResponse = scsResponse.urllib2Response
			if 200 == sinaResponse.code:
				ip = self.util.getRemoteAddress( request)
				user = self.util.getUser( request, userid)
				url = sinaResponse.url.replace('http://','https://cdn.')
				uploadModel = self.model(file_path=url, user=user, original_filename=file.name, remote_ip=ip, file_size=file.size, content_type=file.content_type, recognized='todo',user_label=form.cleaned_data['user_label'])
				uploadModel.save()
				# use uploadModel.image_id as image_id to save the ImageRecognitionSequene table
				if uploadModel.image_id is not None and 0 < int(uploadModel.image_id):
					sequene = ImageRecognitionSequene.objects.create(image_id=uploadModel.image_id, file_name=filename)
				# save file uploaded to os.path.join(settings.BASE_DIR, 'recognition/images_waiting/' )
				try:
					file.seek(0)
					with open(self.waiting_path + filename, 'wb+') as destination:
						if hasattr(file, 'chunks') and file.multiple_chunks():
							for chunk in file.chunks():
								destination.write(chunk)
						else:
							destination.write( file.read() )
				except Exception as ex:
					message = 'inside post method in sae.sae.home.views.UploadView\n'
					message += "Fail to save request.FILES['file']. ex = " + str(ex)
					logger.error(message)
				self.make_thumbnail(filename=filename, ext=ext)
				return HttpResponseRedirect( self.success_url )
			else:
				form.add_error(NON_FIELD_ERRORS, _("fail to upload this image to our image server, please try again.") )
		return render(request, self.template_name, variables)

	def make_thumbnail(self, filename = '', ext=''):
		if filename is None or '' == filename:
			return False
		thumbnailpath = self.sina_scs_prefix + filename[:(-len(ext)-1)] + '_thumbnail' +'.' + ext
		try:
			image = PIL_Image.open(self.upload_file)
			image.thumbnail( (THUMBNAIL_WIDTH, THUMBNAIL_HEIGHT) )
			try:
				thumbnail = BytesIO()
				image.save(thumbnail,image.format)
				thumbnail_bytes = thumbnail.getvalue()
				# save to local settings.MEDIA_ROOT内
				if not Util.saveThumbnailToMedia(Util, filename, thumbnail_bytes):
					message = 'inside make_thumbnail method in sae.sae.home.views.UploadView\r\n'
					message += 'Fail to save thumbnail to local settings.MEDIA_ROOT (' + settings.MEDIA_ROOT + ')'
					logger.error(message)
				scsResponse = self.bucket.put( thumbnailpath, thumbnail_bytes, self.acl )
				sinaResponse = scsResponse.urllib2Response
				if 200 != sinaResponse.code:
					message = 'inside make_thumbnail method in sae.sae.home.views.UploadView\r\n'
					message += '(3) Fail to make thumbnail from the image (url = ' + thumbnailpath + ')'
					logger.error(message)
					return False
			except (KeyError, IOError):
				message = 'inside make_thumbnail method in sae.sae.home.views.UploadView\r\n'
				message += '(1) Fail to make thumbnail from the image (url = ' + thumbnailpath + ')'
				logger.error(message)
				return False
		except IOError as ex:
			message = 'inside make_thumbnail method in sae.sae.home.views.UploadView\r\n'
			message += '(2) Fail to make thumbnail from the image (url = ' + thumbnailpath + ')'
			logger.error(message)
			return False
		return True

