import datetime

from django.shortcuts import render
from django.views.generic import TemplateView
from django.db.models import Q
from django.urls import reverse
from django.contrib.auth.views import LoginView, LogoutView
from django.views.generic.edit import FormView
from django.utils.translation import gettext_lazy as _
from django.http import HttpResponseRedirect
from django.contrib.auth import login as auth_login
from django.contrib.auth.models import Group

from sae.basic.models import User, Image, InternalMessage
from sae.basic.utils import Util
from sae.register.forms import UserForm

class UserLogoutView(LogoutView):
	next_page = '/'
	template_name = 'index_index.html'

class UserLoginView(LoginView):
	template_name = 'register_login.html'
	success_url = '/home/'

	def get(self, request, *args, **kwargs):
		form_class = self.get_form_class()
		form = self.get_form(form_class)
		variables = {
			'page_title': _('login'),
			'form':form,
		}
		return render(request, self.template_name, variables)

	def post(self, request, *args, **kwargs):
		form_class = self.get_form_class()
		form = self.get_form(form_class)
		if form.is_valid():
			print( request.session.items() )
			#set this session item for sae.home.views.HomeView to add one record to LoginRecord after login successfully
			if not Util.checkLogin(Util, request):
				request.session['just_visit_login'] = True
			auth_login(request, form.get_user())
			return HttpResponseRedirect( self.success_url )
		variables = {
			'page_title': _('login'),
			'form':form,
		}
		return render(request, self.template_name, variables)

class RegisterView(FormView):
	template_name = 'register_register.html'
	form_class = UserForm
	success_url = '/home/'
	model = User

	def get(self, request, *args, **kwargs):
		form_class = self.get_form_class()
		form = self.get_form(form_class)
		variables = {
			'page_title': _('register'),
			'form': form,
		}
		return render(request, self.template_name, variables)

	def post(self, request, *args, **kwargs):
		form_class = self.get_form_class()
		form = self.get_form(form_class)
		variables = {
			'page_title': _('register'),
			'form': form,
		}
		new_id = 0
		if form.is_valid():
			username = form.cleaned_data.get("username")
			raw_password = form.cleaned_data.get("password")
			email = form.cleaned_data.get("email")
			mobile = form.cleaned_data.get("mobile")
			# print(username, raw_password, email, mobile)
			user = User(username=username,email=email, mobile=mobile)
			user.set_password(raw_password)
			user.save()
			group = Group.objects.get(name__exact='all')
			user.groups.add(group)
			if hasattr(user, 'pk') and user.pk is not None and 0 < int(user.pk):
				user = User.objects.get(id=user.pk)
				auth_login(request, user)
				self.send_welcome_message(user)
				return HttpResponseRedirect( self.success_url )
		return render(request, self.template_name, variables)

	def send_welcome_message(self, user=None):
		if user is None or not hasattr(user, 'pk'):
			return 0
		first_admin = Util.getFirstAdmin(Util)
		title = _('Welcome to Image Pocket')
		body = _('Hello there. We are looking forward to serving you via this little piece of app. We hope you have a great experience in using it. You should recall your good times while reviewing your old images from time to time')
		message = InternalMessage.objects.create(from_user=first_admin, to_user_id=user.pk, group=None, message_title=title, message_body=body)
		if message is not None and hasattr(message, 'pk'):
			return message.pk
		return 0

class ForgetPasswordView(TemplateView):
	template_name = 'register_forgotten.html'

	def get(self, request, *args, **kwargs):
		variables = {}
		return render(request, self.template_name, variables)

	def post(self, request, *args, **kwargs):
		pass
