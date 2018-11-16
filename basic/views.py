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
		file_name = ''
		variables = {
			'response_code': 403,
			'response_content': 'invalid token',
			'file_name': file_name,
		}
		response_code = '400:'
		if 'token' not in self.kwargs.keys() or self.kwargs['token'] is None:
			return JsonResponse(variables)
		if not Util.validateToken(Util, self.kwargs['token'] ):
			return JsonResponse(variables)

		# get the recognized result from caffe
		if 'result' not in self.kwargs.keys() or 1 > int( self.kwargs['result'] ):
			response_code = '400: need result code'
		elif 'filename' not in self.kwargs.keys() or '' == str( self.kwargs['filename'] ):
			response_code = '400: need image file name'
		else:
			result = int( self.kwargs['result'] )
			file_name = str( self.kwargs['filename'] )
			try:
				this_sequene = ImageRecognitionSequene.objects.filter(file_name__exact=file_name).get()
				if this_sequene is None or not hasattr(this_sequene, 'image') or this_sequene.image is None:
					response_code = '404: no image record found in Image'
				else:
					this_image = this_sequene.image
					word = SynsetWords.objects.get(pk=1+result)
					this_image.recognized_time = datetime.datetime.now()
					this_image.recognized = word.label # word.label is string
					# eval(word.label) is dictionary
					this_image.save()
					response_code = '200: database updated'
					this_sequene.delete()
			except ImageRecognitionSequene.DoesNotExist as ex:
				response_code = '404: no sequene record found'

		# render a json string
		temp = response_code.split(':', 1)
		variables = {
			'response_code': int( temp[0] ),
			'response_content': str( temp[1] ),
			'file_name': file_name,
		}
		return JsonResponse(variables)
