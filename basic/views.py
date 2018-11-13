import logging, os, datetime, sys
import psutil  #, numpy

from django.shortcuts import render
from django.http import JsonResponse
from django.views.generic import TemplateView
from django.conf import settings as django_settings
from django.utils.log import configure_logging
from django.utils.translation import gettext_lazy as _

from sae import settings
from sae.basic.models import Image, ImageRecognitionSequene, SynsetWords
from sae.basic.utils import Util
from sae.extend.baidu import BaiduTranslation

# called by Linux Crontab daily for creating log files
class DailyCrontabView(TemplateView):
	template_name = 'basic_daily.html'

	def get(self, request, *args, **kwargs):
		variables = {
			'page_title': _('internal action'),
		}
		return render( request, self.template_name, variables )

class MinuteCrontabView(TemplateView):
	template_name = 'basic_minute.html'

	def get(self, request, *args, **kwargs):
		# read the sequene table for image recognition
		# deleted on 20181113
		file_name = ''
		variables = {
			'response_code': 403,
			'response_content': 'invalid token',
			'file_name': file_name,
		}
		return JsonResponse(variables)
