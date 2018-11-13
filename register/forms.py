from django import forms
from django.forms import ModelForm
from django.core.exceptions import NON_FIELD_ERRORS
from django.utils.translation import gettext_lazy as _

from sae.basic.models import User
from sae.basic.validators import username_unique_validator, mobile_validator, email_unique_validator

class UserForm(ModelForm):

	username = forms.CharField(
		label=_('username'),max_length=150,
		help_text=_('Required. 150 characters or fewer. Letters, digits and @/./+/-/_ only.'),
		validators=[username_unique_validator],
	)
	password = forms.CharField(label=_('password'), max_length=128, help_text=_('input your password'), )
	email = forms.EmailField(
		validators=[email_unique_validator],
	)
	# first_name = forms.CharField( max_length=30, required=False, help_text=_('input your first name'),)
	# last_name = forms.CharField( max_length=150, required=False, help_text=_('input your last name'),)
	# birth_date = forms.DateField(required=False, help_text=_('input your birthday'),)
	# phone = forms.CharField(max_length=24, required=False, help_text=_('input your home phone'),)
	mobile = forms.CharField(
		label=_('mobile'),
		max_length=24, required=False, help_text=_('input your mobile number'),
		validators=[mobile_validator],
	)
	# address = forms.CharField(max_length=255, required=False, help_text=_('input your address'),)

	class Meta:
		model = User
		fields = ('username', 'email', 'password', 'mobile',)
		# widgets = {
		# 	'text':forms.Textarea(attrs={'cols':50,'rows':3}),
		# }
		error_messages = {
			NON_FIELD_ERRORS: {}
		}

	# comment out below because it is difficult to reach request
	# def clean(self):
	# 	cleaned_data = super().clean()
		# user_label = cleaned_data.get("user_label")
		# files = self.files
		# (key, file), = files.items()
		# if file.name == request.session['just_uploaded']:
		# 	msg = _('please do not upload the same image')
		# 	self.add_error(NON_FIELD_ERRORS, msg)
