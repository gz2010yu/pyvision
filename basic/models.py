from django.db import models
from django.urls import reverse
from django.utils.translation import gettext_lazy as _
from django.contrib.auth.models import AbstractUser, Group
from django.utils import timezone

from sae.basic.validators import wechat_openid_validator

class User(AbstractUser):
	birth_date = models.DateField(
		_('user birthday'),
		help_text=_('please select your birthday'),
		blank=True,
		null=True,
	)
	phone = models.CharField(
		_('user phone number'),
		max_length=24,
		help_text=_('please input your phone number'),
		blank=True,
		null=True,
	)
	mobile = models.CharField(
		_('user mobile number'),
		max_length=24,
		help_text=_('please input your mobile number'),
		blank=True,
		null=True,
	)
	address = models.CharField(
		_('user address'),
		max_length=255,
		help_text=_('please input your address'),
		blank=True,
		null=True,
	)
	wechat_openid = models.CharField(
		_('wechat openid'),
		max_length=64,
		help_text=_('please provide your WeChat openid'),
		validators=[wechat_openid_validator],
		# with the 3 settings below, there is no need to use a validator
		# see Field options null at https://docs.djangoproject.com/en/2.1/ref/models/fields/
		blank=True,
		null=True,
		unique=True,
	)

	class Meta():
		abstract = False
		swappable = 'AUTH_USER_MODEL'
		# db_table = 'basic_user' # do not use this. create a new db instead

	def __str__(self):
		# print(self.last_name)
		return self.username

	# @classmethod
	def get_full_name(self):
		"Returns the person's full name."
		if None == self.first_name and None == self.last_name:
			full_name = self.__str__()
		else:
			full_name = '%s%s' % (self.last_name, self.first_name)
			from sae.basic.utils import Util
			if Util.stringIsPureChinese(Util, full_name):
				return full_name
			full_name = '%s %s' % (self.first_name, self.last_name)
		return full_name

	def get_absolute_url(self):
		return '/peteronly/basic/user/'+str(self.id)+'/change/'
		# http://127.0.0.1:8000/peteronly/basic/user/1/change/

	# raw_password is a md5, like: 2d905e50c6b39dfdae152e488389e361
	# def check_password(self, raw_password):
	# 	from sae.basic.validators import check_password
	# 	return check_password(raw_password, self.password) 
		# overwrite check_password function in django.contrib.auth.base_user.py
		# see line 8: from django.contrib.auth.hashers import (check_password, is_password_usable, make_password,)

class LoginRecord(models.Model):
	login_id = models.AutoField(primary_key=True)
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	login_time = models.DateTimeField( default=timezone.now )
	login_ip = models.GenericIPAddressField(help_text=_('automatically fill in after user logined'),)

	def __str__(self):
		return str(self.login_id)

class Image(models.Model):
	image_id = models.AutoField(primary_key=True)
	user = models.ForeignKey(User, on_delete=models.CASCADE)
	upload_time = models.DateTimeField( default=timezone.now )
	recognized_time = models.DateTimeField( default=timezone.now )
	remote_ip = models.GenericIPAddressField( blank=True,null=True, )
	file_size = models.IntegerField(default=0)
	content_type = models.CharField(max_length=32,blank=True,null=True,)
	file_path = models.CharField(
		_('SCS uri'),
		max_length=255,
		help_text=_('automatically fill in SCS uri'),
		blank=False,
		null=False,
		unique=True,
	)
	# do not use FilePathField() for file_path because this is a uri, not a file path
	original_filename = models.CharField(
		_('original filename'),
		max_length=255,
		help_text=_('original filename provided by user'),
		blank=False,
		null=False,
		default='',
	)
	recognized = models.CharField(
		_('recognized catagories'),
		max_length=512,
		help_text=_('recognized text result by caffe, in dict format, fill automatically'),
		blank=True,
		null=True,
	)
	user_label = models.CharField(
		_('user label'),
		max_length=1023,
		help_text=_('please input a label for this image'),
		blank=True,
		null=True,
	)

	def __str__(self):
		return str(self.image_id)

class InternalMessage(models.Model):
	message_id = models.AutoField(primary_key=True)
	from_user = models.ForeignKey(
		User, on_delete=models.CASCADE, null=False, blank=False,
	)
	# even if sent by the system, it will assign one system admin as the message sender
	to_user_id = models.PositiveIntegerField()
	# if null, the group field below is required and vice versa
	group = models.ForeignKey(
		Group, on_delete=models.CASCADE, null=True, blank=True,
	)
	# if group is not None, this message will be sent to all users in this group
	# also if group is not None, to_user will be useless
	send_time = models.DateTimeField( default=timezone.now )
	read_time = models.DateTimeField(
		auto_now=False,
		auto_now_add=False,
		null=True, blank=True,
	)
	status = models.PositiveSmallIntegerField( default=1 )
	# 0 == deleted; 1 == sent; 2 == read; 3 == marked favor: currently only 1 and 2
	
	message_title = models.CharField(
		_('message title'),
		max_length=255,
		help_text=_('please input the message title'),
	)
	message_body = models.CharField(
		_('message body'),
		max_length=1024,
		help_text=_('please input the message body'),
	)
	# Any fields that are stored with VARCHAR column types have their max_length restricted to 255 characters if you 
	# are using unique=True for the field. This affects CharField, SlugField.
	# https://docs.djangoproject.com/en/2.1/ref/databases/

	def __str__(self):
		return str(self.message_id)

	def save(self, *args, **kwargs):
		if 1 > self.to_user_id and self.group is None:
			raise ValueError("both to_user and group fields are null in Message model saving.")
		else:
			super().save(*args, **kwargs)
		
class UnreadGroupMessage(models.Model):
	""" instead of having a ManyToMany field in Message Model, we create this table
		read message will be deleted from this table
	"""
	unread_id = models.AutoField(primary_key=True)
	message = models.ForeignKey(
		InternalMessage, on_delete=models.CASCADE, null=False, blank=False,
	)
	user = models.ForeignKey(
		User, on_delete=models.CASCADE, null=False, blank=False,
	)

	def __str__(self):
		return str(self.unread_id)

class ImageRecognitionSequene(models.Model):
	""" This table is a temporary table for image recognition
		There is no recognition log and results will be written into Image directly
	"""
	sequene_id = models.AutoField(primary_key=True)
	image = models.ForeignKey(
		Image, on_delete=models.CASCADE, null=False, blank=False,
	)
	file_name = models.CharField(
		max_length=254,
		blank=False,
		null=False,
		unique=True,
	)

	def __str__(self):
		return str(self.file_name)

class SynsetWords(models.Model):
	word_id = models.AutoField(primary_key=True)
	serial_key = models.CharField(
		max_length=16,
		blank=False,
		null=False,
		unique=True,
	)
	label = models.CharField(
		max_length=512,
		blank=False,
		null=False,
		default='',
	)

	def __str__(self):
		return str(self.serial_key)		
