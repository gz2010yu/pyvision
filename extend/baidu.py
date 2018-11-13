# !/usr/bin/env python
# Author: https://blog.csdn.net/sunchengquan/article/details/82314633

import json, random, logging
import requests, urllib.parse
from hashlib import md5

logger = logging.getLogger('django')

class BaiduTranslation(object):
	"""docstring for BaiduTranslation
	obj = BaiduTranslation(text='A rich man is absolutely willful')
	code, string = obj.request_baidu()
	print(code)
	print(string)
	"""
	def __init__(self, fromLang='en',toLang='zh',text=''):
		self.appid = '20181112000232775'
		self.secretKey = 'wp00WdyoZiNO2O_bdXk4'
		self.uri_base = 'https://api.fanyi.baidu.com/api/trans/vip/translate'
		self.fromLang = fromLang
		self.toLang = toLang
		self.salt = str(random.randint(32768, 65536))
		self.text = text
		self.sign = self.make_sign()
		self.uri_baidu = self.make_uri()

	def make_sign(self):
		if '' == self.text:
			return ''
		sign = self.appid + self.text + self.salt + self.secretKey
		m1 = md5()
		m1.update(sign.encode("utf-8"))
		return m1.hexdigest()

	def make_uri(self):
		if '' == self.sign:
			return ''
		return self.uri_base + '?appid=' + self.appid + '&q=' + urllib.parse.quote(self.text) + '&from=' + self.fromLang + '&to=' + self.toLang + '&salt=' + self.salt + '&sign=' + self.sign

	def request_baidu(self, text=''):
		if '' == text and '' == self.text:
			return 400, ''
		if '' != text:
			self.text = text
			self.sign = self.make_sign()
			self.uri_baidu = self.make_uri()
		try:
			with requests.get(self.uri_baidu) as response:
				if response is not None and hasattr(response, 'status_code') and 200 == response.status_code and hasattr(response, 'text'):
					temp = json.loads(response.text)
					if 'trans_result' in temp.keys():
						return 200, str(json.loads(response.text)['trans_result'][0]['dst'])
					elif 'error_code' in temp.keys():
						reason = str( response.text )
						message = 'inside request_baidu method in sae.sae.extend.baidu.BaiduTranslation\n'
						message += reason
						logger.error(message)
						return int(temp['error_code']), reason
				else:
					reason = 'baidu server response error'
					message = 'inside request_baidu method in sae.sae.extend.baidu.BaiduTranslation\n'
					message += reason
					logger.error(message)
					return 400, reason
		except Exception as ex:
			reason = 'baidu server request error. ex = ' + str(ex)
			message = 'inside request_baidu method in sae.sae.extend.baidu.BaiduTranslation\n'
			message += reason
			logger.error(message)
			return 400, reason
		# print(response)		# <Response [200]>
		# if hasattr(response, 'text'):
		# 	print( response.text )
		# {"error_code":"58000","error_msg":"INVALID_CLIENT_IP","data":{"client_ip":"123.125.23.213"}}
		# {"from":"en","to":"zh","trans_result":[{"src":"summary","dst":"\u603b\u7ed3"}]}
