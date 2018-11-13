import re

from django.core.exceptions import ValidationError
from django.utils.translation import gettext_lazy as _

from sae.basic.models import *

# see wechat_openid field in sae.basic.models.User
def wechat_openid_validator(value):
	try:
		checkWechat = User.objects.get(wechat_openid__iexact=value)
	except User.DoesNotExist:
		checkWechat = None
	if checkWechat is not None:
		raise ValidationError(
			_('%(value)s has been registered by another user'),
			params={'value': value},
		)

def mobile_validator(value):
	if value is not None and '' != value and re.match( r'^[\d\s\(\)\.-]+$', value) is None:
		raise ValidationError(
			_(' %(value)s should contain only digits, dots, spaces, hyphens, or brackets'),
			params={'value': value},
		)

def email_unique_validator(value):
	from sae.basic.models import User # User can ONLY by imported here
	try:
		checkEmail = User.objects.get(email__iexact=value)
	except User.DoesNotExist:
		checkEmail = None
	if checkEmail is not None:
		raise ValidationError(
			_('User %(username)s has registered using the same email address (%(value)s)'),
			params={'username': checkEmail.username, 'value':value,},
		)

def username_unique_validator(value):
	# from django.contrib.auth.validators import UnicodeUsernameValidator
	# include the content of the above validator
	if re.match( r'^[\w.@+-]+$', value) is None:
		raise ValidationError(
			_('invalid username: %(value)s should only contain letters, digits, dots, @, plus, or hyphens'),
			params={'value': value},
		)
	if re.match( r'[\w.@+-]*--[\w.@+-]*', value) is not None:
		raise ValidationError(
			_('invalid username: %(value)s should not contain --'),
			params={'value': value},
		)

	from sae.basic.models import User # User can ONLY by imported here
	try:
		checkUsername = User.objects.get(username__iexact=value)
	except User.DoesNotExist:
		checkUsername = None
	if checkUsername is not None:
		raise ValidationError(
			_('%(value)s has been registered by another user'),
			params={'value': value},
		)

class UploadFileValidator(object):
	"""docstring for UploadFileValidator"""
	request = None
	file = None
	def __init__(self, request = None):
		super(UploadFileValidator, self).__init__()
		self.request = request
		self.file = self.request.FILES['file']
		
	def check_file_size(self, upper_limit = 5242880):
		if self.request is None:
			return ''
		if upper_limit < self.file.size:
			return _('this image is more than %s MB' % round(upper_limit/1048576, 1) )
		return ''

	def check_multiple_form_submit(self):
		if self.request.session.has_key('just_uploaded') and self.file.name == self.request.session['just_uploaded']:
			return _('please do not upload the same image')
		return ''
