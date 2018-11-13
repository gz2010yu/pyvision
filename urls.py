"""sae URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
	https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
	1. Add an import:  from my_app import views
	2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
	1. Add an import:  from other_app.views import Home
	2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
	1. Import the include() function: from django.urls import include, path
	2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import include, path, re_path
from django.contrib import admin
admin.autodiscover()
from django.contrib.auth.decorators import login_required
from django.conf import settings
from django.conf.urls.static import static

# from sae.sae01.views import ShowDbView, CreateView, CipherView, TestView
from sae.home.views import HomeView, ImageDetailView, UploadView, MessageListView, MessageDetailView, SettingsView
from sae.register.views import UserLoginView, UserLogoutView, RegisterView, ForgetPasswordView
from sae.index.views import IndexView, TermsView, PrivacyView, AboutUsView
from sae.basic.views import MinuteCrontabView, DailyCrontabView

login_patterns = [
	re_path(r'^$', UserLoginView.as_view(), name='user-login' ),
	re_path(r'^logout/', UserLogoutView.as_view(), name='user-logout' ),
	re_path(r'^register/', RegisterView.as_view(), name='user-register' ),
	# re_path(r'^forgotten/', ForgetPasswordView.as_view(), name='user-forgotten-password' ),
]

home_patterns = [
	re_path(r'^$', login_required(HomeView.as_view()), name='home-index' ),
	re_path(r'^page/(?P<pagenum>\d+)/', login_required(HomeView.as_view()), name='home-index-page' ),
	re_path(r'^image/(?P<image_id>\d+)/page/(?P<pagenum>\d+)/', login_required( ImageDetailView.as_view()), {'goto': 1}, name='one-single-image' ),
	# re_path(r'^image/(?P<image_id>\d+)/', login_required( ImageDetailView.as_view()), {'goto': 1}, ),
	re_path(r'^upload/', login_required( UploadView.as_view() ), name='upload-one-image' ),
	re_path(r'^settings/', login_required( SettingsView.as_view() ), name='home-settings' ),
	re_path(r'^messages/', login_required( MessageListView.as_view() ), name='message-list' ),
	re_path(r'^message/(?P<message_id>\d+)/', login_required( MessageDetailView.as_view() ), name='message-detail' ),
	re_path(r'^aboutus/', login_required( AboutUsView.as_view() ), {'goto': 1}, name='home-about-us' ),
	re_path(r'^terms/', login_required( TermsView.as_view() ), {'goto': 1}, name='home-user-terms' ),
	re_path(r'^privacy/', login_required( PrivacyView.as_view() ), {'goto': 1}, name='home-user-privacy' ),
]

crontab_patterns = [
	re_path(r'^goal/(?P<goal>\d+)/result/(?P<result>\d+)/filename/(?P<filename>(\w|\.)+)/token/(?P<token>\w+)', MinuteCrontabView.as_view(), name='crontab-minute' ),
	re_path(r'^goal/(?P<goal>\d+)/token/(?P<token>\w+)', MinuteCrontabView.as_view(), name='crontab-minute' ),
	re_path(r'^daily/', DailyCrontabView.as_view(), name='crontab-daily' ),
]

urlpatterns = [
	re_path(r'^peteronly/', admin.site.urls),
	re_path(r'^$',IndexView.as_view(), name='index' ),
	re_path(r'^page/(?P<pagenum>\d+)/',IndexView.as_view(), name='index-page' ),
	# re_path(r'^db/', login_required( ShowDbView.as_view()) ), # to be deleted, for debug only
	# re_path(r'^cipher/', login_required( CipherView.as_view()) ), # to be deleted, for debug only
	# re_path(r'^create/', login_required( CreateView.as_view() ) ), # to be deleted, for debug only
	# re_path(r'^deb/', login_required( TestView.as_view() ) ), # to be deleted, for debug only
	re_path(r'^home/', include(home_patterns) ),
	re_path(r'^login/', include(login_patterns) ),
	re_path(r'^aboutus/', AboutUsView.as_view(), {'goto': 2}, name='about-us' ),
	re_path(r'^terms/', TermsView.as_view(), {'goto': 2}, name='user-terms' ),
	re_path(r'^privacy/', PrivacyView.as_view(), {'goto': 2}, name='user-privacy' ),
	re_path(r'^image/(?P<image_id>\d+)/page/(?P<pagenum>\d+)/', ImageDetailView.as_view(), {'goto': 2}, name='one-admin-image' ),
	re_path(r'^crontab/', include(crontab_patterns) ),
] + static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)

