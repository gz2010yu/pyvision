import datetime

from django.shortcuts import render
from django.views.generic import TemplateView
from django.views.generic.list import ListView
from django.db.models import Q
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from django.core.paginator import EmptyPage, PageNotAnInteger, Paginator

from sae.basic.models import User, Image, SynsetWords
from sae.basic.utils import Util
from sae import settings

class ObjectListView(ListView):
	template_name = 'index_objects.html'

	def get(self, request, *args, **kwargs):
		try:
			objects = SynsetWords.objects.order_by('word_id').only('word_id', 'label')
		except SynsetWords.DoesNotExist:
			objects = None
		if objects is not None:
			paginator = Paginator(objects, 50, settings.ORPHANS, settings.ALLOW_EMPTY_FIRST_PAGE) # settings.PER_PAGE
			page = request.GET.get('page')
			if page is None:
				page = 1
			objects = paginator.get_page(page)
		variables = {
			'objects': objects,
			'page_title': _('objects'),
		}
		return render(request, self.template_name, variables)

class InstructionView(TemplateView):
	template_name = 'index_instruction.html'

	def get(self, request, *args, **kwargs):
		variables = {
			'page_title': _("Instructions"),
		}
		return render(request, self.template_name, variables)

class AboutUsView(TemplateView):
	template_name = 'index_aboutus.html'

	def get(self, request, *args, **kwargs):
		goto = 1
		if 'goto' in self.kwargs.keys() and self.kwargs['goto'] is not None and 1 != int( self.kwargs['goto'] ):
			goto = int( self.kwargs['goto'] )
			self.template_name = 'home_aboutus.html'
		contents = [
			_("This app is developed by xxx company."),
			_("The company owns many non-profit/low-profit projects for educators and parents."),
			_("Photo Pocket is one of these projects."),
			_("The project aims to provide kids and youths a pocket to store photos. "),
			# _("The project aims to provide kids and youths expending their knowledge scopes. "),
			# _("By uploading photos, users can have them recognized and wiki information about the recognized objects are provided."),
		]
		variables = {
			'contents':contents,
			'page_title': _("about us"),
		}
		return render(request, self.template_name, variables)

class TermsView(TemplateView):
	template_name = 'index_aboutus.html'

	def get(self, request, *args, **kwargs):
		goto = 1
		if 'goto' in self.kwargs.keys() and self.kwargs['goto'] is not None and 1 != int( self.kwargs['goto'] ):
			goto = int( self.kwargs['goto'] )
			self.template_name = 'home_aboutus.html'
		contents = [
			_("Terms and Conditions"),
			_("These terms of use cover your use of this app and its related websites. Using this app, you accept all terms of use. If you disagree with any of these terms, you must not use this app and its websites."),
			_("You may download or print this app and its websites for caching purposes and for your own personal use only. "),
			_("By uploading images, you agree to provide us and our third-parties all these uploaded images for futher analysis. All images will be owned by us and our third-parties. "),
		]
		variables = {
			'contents':contents,
			'page_title': _("terms")
		}
		return render(request, self.template_name, variables)

class PrivacyView(TemplateView):
	template_name = 'index_aboutus.html'

	def get(self, request, *args, **kwargs):
		goto = 1
		if 'goto' in self.kwargs.keys() and self.kwargs['goto'] is not None and 1 != int( self.kwargs['goto'] ):
			goto = int( self.kwargs['goto'] )
			self.template_name = 'home_aboutus.html'
		contents = [
			_("Privacy Statement"),
			_("This Privacy Policy discloses the privacy practices for this app and its websites. By using this app, you are agreeing to our collection and use of your information. "),
			_("Information gathered during your usage of this app:"),
			_("We and our third-parties collect your IP address, WeChat openid, browser type, pages you visited, and other information for purposes such as to identify the general geographic area, to help you login your account without entering a password if you use WeChat, and other purposes for reasons listed below."),
			_("Reasons for gathering your information:"),
			_("By collecting these information, we can do a better job in systems administration, abuse prevention, and in user trends understanding."),
			_("This Privacy Policy may change from time to time. Any such changes will be posted on this page. The effective date of this policy is October 22, 2018.")
		]
		variables = {
			'contents':contents,
			'page_title': _("Privacy Statement")
		}
		return render(request, self.template_name, variables)

class IndexView(TemplateView):
	template_name = 'index_index.html'
	util = Util()

	def get(self, request, *args, **kwargs):
		pagenum = 1
		if 'pagenum' in self.kwargs.keys() and self.kwargs['pagenum'] is not None and 1 < int( self.kwargs['pagenum'] ):
			pagenum = int( self.kwargs['pagenum'] )
		firstadmin = self.util.getFirstAdmin()
		if firstadmin is not None:
			try:
				adminimages = Image.objects.filter( Q(user__exact=firstadmin) ).order_by('-upload_time').only('recognized','file_path','upload_time','image_id')
			except Image.DoesNotExist:
				adminimages = None
			if adminimages is None:
				images = None
			else:
				paginator = Paginator(adminimages, settings.PER_PAGE, settings.ORPHANS, settings.ALLOW_EMPTY_FIRST_PAGE)
				page = request.GET.get('page')
				if page is None:
					page = pagenum
				images = paginator.get_page(page)
		else:
			images = None
		logined = self.util.checkLogin(request = request)
		variables = {
			'firstadmin_name': '' if firstadmin is None else firstadmin.get_full_name,
			'images': images,
			'logined': logined,
			'page_title': _('welcome'),
			'tzname': self.util.getTimezone( request ),
		}
		return render(request, self.template_name, variables)
