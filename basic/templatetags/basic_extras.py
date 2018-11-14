from datetime import datetime as dt
from datetime import timedelta
import datetime
import logging, base64, requests, math
from PIL import Image as PIL_Image
from io import BytesIO

from django import template
from django.template.defaultfilters import stringfilter
from django.templatetags.tz import do_timezone
from django.utils import timezone
from django.utils.translation import gettext_lazy as _

from sae.basic.utils import Util
from sae import settings

logger = logging.getLogger('django')
register = template.Library()

@register.filter(name='getOneThumbnailBase64')
def getOneThumbnailBase64(value):
	filename = Util.getMediaPath(Util, value, True)
	mediapath = settings.MEDIA_ROOT + filename
	try:
		image = PIL_Image.open( mediapath )
		thumbnail = BytesIO()
		image.save(thumbnail,image.format)
		thumbnail_bytes = thumbnail.getvalue()
		if thumbnail_bytes is not None and isinstance(thumbnail_bytes, bytes):
			return 'data:image/'+ image.format.lower() +';base64,' + str( base64.b64encode( thumbnail_bytes ) )[2:-1]
		else:
			return ''
	except FileNotFoundError as no_file:
		message = 'inside getOneThumbnailBase64 method in sae.sae.basic.templatetags.basic_extras.py\r\n'
		message += 'Thumbnail File is not found at ' + mediapath
		logger.error(message)
		# get file from Sina SCS and save it to local media folder
		code, content_type, file_bytes = Util.getThumbnailFromSCS(Util, value)
		if '1' == code:
			if not Util.saveThumbnailToMedia(Util, filename, file_bytes ):
				message = 'inside getOneThumbnailBase64 method in sae.sae.basic.templatetags.basic_extras.py\r\n'
				message += 'Fail to save thumbnail to local settings.MEDIA_ROOT (' + settings.MEDIA_ROOT + ')'
				logger.error(message)
			return 'data:'+content_type+';base64,' + str( base64.b64encode( file_bytes ) )[2:-1]
		elif '2' == code:
			return content_type
		else:
			return ''
	except Exception as ex:
		message = 'inside getOneThumbnailBase64 method in sae.sae.basic.templatetags.basic_extras.py\r\n'
		message += 'Error happened when trying to open Thumbnail file at ' + mediapath + ':\r\n'
		message += ( str(type(ex)) + '  ' + str(ex) )
		logger.error(message)
		code, content_type, file_bytes = Util.getThumbnailFromSCS(Util, value)
		if '1' == code:
			return 'data:'+content_type+';base64,' + str( base64.b64encode( file_bytes ) )[2:-1]
		elif '2' == code:
			return content_type
		else:
			return ''

@register.filter(name='getOneImageBase64')
def getOneImageBase64(value):
	try:
		with requests.get(value) as response:
			if response is not None and hasattr(response, 'status_code') and 200 == response.status_code:
				return 'data:'+response.headers['Content-Type']+';base64,' + str( base64.b64encode( response.content ) )[2:-1]
	except Exception as ex:
		message = 'inside getOneImageBase64 function in sae.sae.basic.templatetags.basic_extras.py\r\n'
		message += ( str(type(ex)) + '  ' + str(ex) )
		logger.error(message)
		return value
	return ''

@register.filter(name='messagestatustext')
def messagestatustext(value):
	if 'int' == type(value):
		return _('unread') if 1 == value else _('read')
	try:
		temp = int(value)
	except Exception as ex:
		message = 'inside messagestatustext function in sae.sae.basic.templatetags.basic_extras.py\r\n'
		message += ( str(type(ex)) + '  ' + str(ex) )
		logger.error(message)
		return ''
	else:
		return _('unread') if 1 == temp else _('read')

@register.filter(name='getTimeSpan')
def getTimeSpan(value, arg):
	"""
	calculate the time elapsed from uploading to the finishing point of recognition
	"""
	if not isinstance(value, dt) or not isinstance(arg, dt):
		return '--'
	string1 = value.strftime("%Y-%m-%d %H:%M:%S")
	string2 = arg.strftime("%Y-%m-%d %H:%M:%S")
	if string1 == string2:
		return '--'
	delta = arg - value - timedelta(seconds=28800)
	# there is a bug here. The Django uses UTC while MySQL SYSDATE() uses local time, 8 * 3600 = 28800
	seconds = delta.seconds
	hours = math.floor( seconds / 3600 )
	minutes = math.floor( (seconds - 3600 * hours) / 60 )
	seconds = seconds - 3600 * hours - 60 * minutes
	if 0 < delta.days:
		try:
			string = str(delta.days) + ' ' + _('day(s)') + ' ' + str(hours).zfill(2) + ':' + str(minutes).zfill(2) + ':' + str(seconds).zfill(2)
			return string
		except TypeError as ex:
			string = str(hours).zfill(2)  + ':' + str(minutes).zfill(2) + ':' + str(seconds).zfill(2)
		except Exception as ex:
			string = str(delta.seconds)
		return string
	else:
		return str(hours).zfill(2)  + ':' + str(minutes).zfill(2) + ':' + str(seconds).zfill(2)

@register.filter(name='getRecognizedString')
def getRecognizedString(value):
	"""
	According to front end browser's language setting to display the recognition dictionary string
	"""
	if '{' != value[0] or '}' != value[-1]:
		return value
	try:
		dictionary = eval(value)
		english = dictionary.keys()
		english = ", ".join(english)
	except Exception as ex:
		return value
	if str == type(dictionary) or 0 == len(dictionary) or english is None or '' == english:
		return value
	
	if 'unread' == _('unread'):
		# Front end user is using English browser to visit us
		return english
	simplified_chinese = dictionary.values()
	simplified_chinese = "，".join(simplified_chinese)
	return simplified_chinese + '(' + english + ')'

@register.filter(name='customizedlocaltime')
def customizedlocaltime(value, arg):
	"""
	Convert a datetime to local time in the active time zone.
	This only makes sense within a {% localtime off %} block.
	"""
	tzone = arg if arg is not None and 'str' == type(arg) else 'Asia/Shanghai'
	return do_timezone(value, tzone)

@register.filter(name='isdatetimeinstance')
def isdatetimeinstance(value):
	# print( type(value) )
	return isinstance(value, datetime.datetime )

@register.filter(name='istimeinstance')
def istimeinstance(value):
	# print(value)
	return isinstance(value, datetime.time )

@stringfilter
@register.filter(name='readdb')
def readdb(value):
	from sae.basic.utils import Util
	util = Util()
	return util.getDbPairs(value)
	
