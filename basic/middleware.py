import os
import datetime
import logging

from django.contrib.auth.models import AnonymousUser

request_logger = logging.getLogger('django.request')

from sae import settings
from sae.basic.utils import Util

class CrontabMiddleware:
	"""The Crontab Middleware will be moved to other place if later a linux crontab is set up."""
	# currently is disabled in MIDDLEWARE in settings.py
	def __init__(self, get_response):
		self.get_response = get_response
		# One-time configuration and initialization.

	def __call__(self, request):
		# Code to be executed for each request before
		# the view (and later middleware) are called.

		response = self.get_response(request)

		# log request:
		# print('inside __call__ method in sae.basic.middleware.CrontabMiddleware ')
		# print( Util.getKeysPerObject(Util, request) )
		# request.COOKIES, request.META, request._encoding, request._get_full_path, request._get_raw_host, 
		# request.encoding, request.environ, request.parse_file_upload, request.path, request._current_scheme_host
		# request.get_port(), request.get_host(), request.META['HTTP_ACCEPT_LANGUAGE'], request.path_info
		# request.get_full_path(), request.get_full_path_info(),
		# aboves are not used; belows are used
		# request.LANGUAGE_CODE == zh-hans, request.get_raw_uri() == http://127.0.0.1:8000/image/35/1
		# request.META['HTTP_ACCEPT_ENCODING'], request.META['HTTP_REFERER'], request.method
		# request.META['HTTP_USER_AGENT'],
		# request.is_ajax(), request.is_secure()
		# request.content_type == text/plain, request.method == GET
		if isinstance(request.user, AnonymousUser):
			user_id = 'AnonymousUser'
		elif hasattr(request, 'user') and request.user is not None:
			if hasattr(request.user, 'id') and request.user.id is not None:
				user_id = str(request.user.id)
			elif 'str' == type(request.user):
				user_id = request.user
			else:
				user_id = '0'
		else:
			user_id = 'no request.user'
		msg = '\nFrom REMOTE_IP = ' + Util.getRemoteAddress(Util, request) + '    user_id = ' + user_id
		msg += '\nHTTP_RAW_URI = ' + request.get_raw_uri()
		msg += '\nHTTP_REFERER = ' + request.META['HTTP_REFERER'] if 'HTTP_REFERER' in request.META.keys() else ''
		msg += '\nMETHOD = ' + request.method if hasattr(request, 'method') else ''
		msg += '    IS_AJAX = ' + str(request.is_ajax()) + '    IS_SECURE = ' + str(request.is_secure())
		msg += '\nHTTP_USER_AGENT = ' + request.META['HTTP_USER_AGENT'] if 'HTTP_USER_AGENT' in request.META.keys() else ''
		msg += '\nLANGUAGE_CODE = ' + request.LANGUAGE_CODE if hasattr(request, 'LANGUAGE_CODE') else ''
		msg += '\nHTTP_ACCEPT_ENCODING = ' + request.META['HTTP_ACCEPT_ENCODING'] if 'HTTP_ACCEPT_ENCODING' in request.META.keys() else ''
		msg += '\nCONTENT_TYPE = ' + request.content_type if hasattr(request, 'content_type') else ''
		msg += '\n'
		request_logger.info(msg)

		return response
