#!/usr/bin/python
# coding: utf-8

import sys, os, requests, json

class ChildProcess(object):
	"""docstring for ChildProcess"""
	def __init__(self, get_path='', filename='', label_index=''):
		super(ChildProcess, self).__init__()
		self.get_path = get_path
		self.filename = filename
		self.label_index = label_index

	def _run(self):
		get_path = self.get_path
		if get_path is None or '' == get_path:
			return False
		try:
			with requests.get(get_path) as response:
				temp = ''
				if response is not None and hasattr(response, 'status_code') and 200 == response.status_code:
					if hasattr(response, 'content'):
						temp = response.content
				if bytes == type( temp ):
					# temp = str( temp ) # , encoding='utf-8'
					temp = bytes.decode(temp) # this line is good for both python2 and python3
				if '' == temp:
					msg = ' requests.get(get_path) returns wrong response in _run method in DaemonCaffe class. response = '
					msg += str(vars( response ))
					sys.stdout.write( msg )
					sys.stdout.flush()
					return False
				else:
					response_code = json.loads(temp)['response_code']
					response_content = json.loads(temp)['response_content']
					if response_code is None or 200 != response_code:
						msg = ' requests.get(get_path) returns wrong response in _run method in DaemonCaffe class. '
						msg += 'response_code = ' + str(response_code) + '   response_content = ' + response_content
						msg += '   filename = ' + self.filename + '. recognition result = ' + self.label_index
						sys.stdout.write( msg )
						sys.stdout.flush()
						return False
					return True
		except Exception as ex:
			msg = ' requests.get(get_path) failed in _run method in DaemonCaffe class. ex = %s' % ex
			sys.stdout.write( msg )
			sys.stdout.flush()
			return False

if __name__ == '__main__':
	if len(sys.argv) == 4:
		get_path = sys.argv[1]
		filename  = sys.argv[2]
		label_index = sys.argv[3]
		if get_path is None or '' == get_path:
			sys.stdout.write( 'use: %s uri_to_call' % sys.argv[0] )
			sys.stdout.flush()
			sys.exit(1)
		obj = ChildProcess(get_path, filename, label_index)
		result = obj._run()
		if True == result:
			sys.exit(0)
		sys.exit(2)
	else:
		sys.stdout.write( 'use: %s start|stop|restart|status' % sys.argv[0] )
		sys.stdout.flush()
		sys.exit(3)
