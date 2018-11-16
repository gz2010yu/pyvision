# from inspect import isfunction
import time, math, hashlib, os
import requests, logging

from django.db.models import Q
from django.core.exceptions import FieldError

from sae.basic.models import User, InternalMessage, UnreadGroupMessage
from sae import settings

logger = logging.getLogger('django')

class Util(object):
	def __init__(self):
		pass

	def validateToken(self, token=''):
		if token is None or '' == str(token):
			return False
		token = str( token )
		all_possible_timestamps = []
		timestamp = math.floor( time.time() )
		with open( os.path.join( settings.BASE_DIR, '../token_key.txt' ) ) as f:
			token_key = f.read().strip()
		for i in range(20):
			key = token_key + str( timestamp + i - 15 )
			all_possible_timestamps.append( hashlib.new('md5', key.encode("utf-8") ).hexdigest() )
		if token in all_possible_timestamps:
			return True
		return False

	def getThumbnailFromSCS(self, value=''):
		if value is None or '' == value:
			return ''
		ext = self.getImageFileNameExtension( self, value )
		thumbnail_path = value[:(value.rfind('.'))] + '_thumbnail.' + ext
		try:
			with requests.get(thumbnail_path) as response:
				if response is not None and hasattr(response, 'status_code') and 200 == response.status_code:
					return '1', response.headers['Content-Type'], response.content
				else:
					return '0', '', b''
		except Exception as ex:
			message = 'inside getThumbnailFromSCS function in sae.sae.basic.util.py\r\n'
			message += ( str(type(ex)) + '  ' + str(ex) )
			logger.error(message)
			return '2', thumbnail_path, b''

	def saveThumbnailToMedia(self, filename='', thumbnail_bytes = None):
		if filename is None or '' == filename or thumbnail_bytes is None:
			return False
		mediapath = settings.MEDIA_ROOT + filename
		with open( mediapath, 'wb+') as destination:
			destination.write( thumbnail_bytes )
		return True

	def getMediaPath(self, file_uri = '', need_filename = False):
		if file_uri is None or '' == file_uri:
			return ''
		pos = file_uri.rfind('?')
		if -1 != pos:
			file_uri = file_uri[:pos]
		if file_uri is None or '' == file_uri:
			return ''
		filename = file_uri
		pos = file_uri.rfind('/')
		if -1 != pos:
			filename = file_uri[pos+1:]
		if need_filename:
			return filename
		return settings.MEDIA_ROOT + filename

	def stringIsPureChinese(self, string = ''):
		if '' == string or string is None:
			return False
		for char in string:
			if not('\u4e00' <= char <= '\u9fa5'):
				return False
		return True

	def getImageFileNameExtension(self, filename = ''):
		if filename is None or '' == filename:
			return ''
		temp = filename.split(".")
		return temp[filename.count(".")]

	def getRemoteAddress(self, request=None):
		if request is None:
			return ''
		if 'HTTP_X_FORWARDED_FOR' in request.META.keys():
			return request.META['HTTP_X_FORWARDED_FOR']
		elif 'REMOTE_ADDR' in request.META.keys():
			return request.META['REMOTE_ADDR']
		return ''

	def getTimezone(self, request=None):
		tzname = request.session.get('django_timezone')
		if tzname is None:
			tzname = "Asia/Shanghai"
		return tzname

	def getUserFullName(self, request=None, user=None, user_id=0):
		if user is None and 1 > int(user_id):
			return ''
		if user is None:
			try:
				user = User.objects.get(id=user_id)
			except User.DoesNotExist:
				message = 'inside getUserFullName method in sae.sae.basic.util.Util\r\n'
				message += 'User.DoesNotExist: user_id = ' + str(user_id)
				logger.error(message)
				user = self.getUserId(request)
		return user.get_full_name()

	def getUnreadMessageNumber(self, user):
		userid = int(user.id) if hasattr(user, 'id') else 0
		if 1 > userid:
			return 0
		try:
			messagesFromOthers = InternalMessage.objects.filter( Q(to_user_id__exact=userid) & Q(status__exact=1) ).count()
		except (TypeError, ValueError, FieldError, NotImplementedError):
			messagesFromOthers = 0
		try:
			messagesFromSystem = UnreadGroupMessage.objects.filter(user__exact=user).count()
		except (TypeError, ValueError, FieldError, NotImplementedError):
			messagesFromSystem = 0
		return int(messagesFromSystem) + int(messagesFromOthers)

	def getUserId(self, request = None):
		condition1 = request.session.has_key( '_auth_user_id' ) and int( request.session.get('_auth_user_id') ) > 0
		if condition1:
			return int( request.session.get('_auth_user_id') )
		return 0

	def getUser(self, request = None, user_id=0):
		if 1 > user_id:
			user_id = self.getUserId(request)
		if 1 > user_id:
			return None
		try:
			user = User.objects.get(id=user_id)
		except user.DoesNotExist:
			message = 'inside getUser method in sae.sae.basic.util.Util\r\n'
			message += 'User.DoesNotExist: user_id = ' + str(user_id)
			logger.warning(message)
			return None
		return user

	def checkLogin(self, request = None):
		if request is None:
			return False
		condition1 = request.session.has_key( '_auth_user_id' ) and int( request.session.get('_auth_user_id') ) > 0 
		condition2 = request.session.has_key( '_auth_user_hash' ) and request.session.get('_auth_user_hash') is not None
		return (condition1 and condition2)

	def getFirstAdmin(self):
		try:
			firstadmin = User.objects.get( Q(is_active__exact=True,)&Q(is_superuser__exact=True,) )
		except User.DoesNotExist:
			try:
				firstadmin = User.objects.get( Q(is_active__exact=True,)&Q(is_staff__exact=True,) )
			except User.DoesNotExist:
				firstadmin = None
		return firstadmin



	# all methods below are for debugging
	def getAttributes(self, obj, show_callable = True):
		allattr = []
		for attr in dir(obj):
			if '_' not in attr and hasattr(obj, attr):
				temp = getattr(obj, attr)
				if not show_callable:
					if not hasattr(temp, '__call__'):
						allattr.append( '%s:%s' %(str(attr), str(temp)) )
				else:
					if hasattr(temp, '__name__'):
						allattr.append( '%s:%s' %(str(attr), str(temp.__name__)) )
					else:
						allattr.append( '%s:%s' %(str(attr), str(temp)) )
		return allattr

	def getAllAttributes(self, objs, show_callable = True):
		allattr = []
		for obj in objs:
			allattr.append( self.getAttributes(self, obj, show_callable) )
		return allattr

	def getKeysPerObject(self, obj, excluded=None):
		allattr = []
		notaccessable = ['objects', ]
		condition1 = excluded is None or '' == str(excluded)
		condition3 = hasattr(obj, str(excluded))
		for attr in dir(obj):
			condition2 = condition3 and attr != str(excluded)
			if condition1 or condition2:
				# print(attr)
				allattr.append( '%s' %( str(attr) ) )
		return allattr

	def getPairsPerObject(self, obj, excluded=None):
		allattr = []
		notaccessable = ['objects', ]
		condition1 = excluded is None or '' == str(excluded)
		condition3 = hasattr(obj, str(excluded))
		for attr in dir(obj):
			condition2 = condition3 and attr != str(excluded)
			if condition1 or condition2:
				# print(attr)
				if not attr in notaccessable:
					temp = getattr(obj, attr)
					if hasattr(temp, '__name__'):
						allattr.append( '%s:%s' %(str(attr), str(temp.__name__)) )
					else:
						allattr.append( '%s:%s' %(str(attr), str(temp)) )
		return allattr

	def getDbPairs(self, obj):
		temp = obj.__doc__
		startInt = temp.find('(') + 1
		endInt = len(temp)-1
		all_fields = temp[startInt:endInt]
		all_fields = all_fields.split(', ')
		allattr = {}
		for attr in all_fields:
			if hasattr(obj, attr):
				allattr[attr] = getattr(obj, attr)
		return allattr # a dictionary

	def getClassName(self, obj):
		temp = obj.__doc__
		startInt = temp.find('(')
		return temp[0:startInt]
				