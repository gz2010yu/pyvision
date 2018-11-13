from django import forms
from django.forms import ModelForm
from django.core.exceptions import NON_FIELD_ERRORS
from django.utils.translation import gettext_lazy as _

from sae.basic.models import Image

class FileFieldForm(ModelForm):
	# file = forms.FileField()
	file = forms.ImageField()
	user_label = forms.CharField(max_length=1023, required=False)
	# error_css_class = 'customized-error-class'
	# required_css_class = 'required'
	class Meta:
		model = Image
		fields = ('user_label',)
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
