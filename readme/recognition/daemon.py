# !/usr/bin/env python
# coding: utf-8

import sys, time, datetime, os, logging
import shutil, subprocess
import logging.handlers # this line cannot be deleted

# config = {}
# logging.config.dictConfig(config)

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
recognition_root = BASE_DIR + '/recognition/'
log_root = BASE_DIR + '/log/recognition/'
tmp_root = os.path.join( recognition_root, 'tmp/' )
with open( os.path.join( BASE_DIR, 'requests_domain.txt' ) ) as f:
	domain_name = f.read().strip() # 'https://www.your_domain.com'

from daemon.basic import Daemon

class DaemonCaffe(Daemon):
	waiting_path = recognition_root + 'images_waiting/'
	done_path = recognition_root + 'images_done/'

	# override _run method of parent class Daemon
	def _run(self, *args, **kwargs):
		caffe_root = BASE_DIR + '/caffe/'
		sys.path.insert(0, caffe_root + 'python')
		import numpy as np
		import caffe
		start_timestamp = time.time()
		caffe.set_mode_cpu()
		model_def = caffe_root + 'models/bvlc_reference_caffenet/deploy.prototxt'
		model_weights = caffe_root + 'models/bvlc_reference_caffenet/bvlc_reference_caffenet.caffemodel'

		net = caffe.Net(model_def, model_weights, caffe.TEST)
		
		# load the mean ImageNet image (as distributed with Caffe) for subtraction
		mu = np.load(caffe_root + 'python/caffe/imagenet/ilsvrc_2012_mean.npy')
		mu = mu.mean(1).mean(1)

		# create transformer for the input called 'data'
		transformer = caffe.io.Transformer({'data': net.blobs['data'].data.shape})

		transformer.set_transpose('data', (2,0,1))  # move image channels to outermost dimension
		transformer.set_mean('data', mu)            # subtract the dataset-mean value in each channel
		transformer.set_raw_scale('data', 255)      # rescale from [0, 1] to [0, 255]
		transformer.set_channel_swap('data', (2,1,0))  # swap channels from RGB to BGR

		# set the size of the input (we can skip this if we're happy
		#  with the default; we can also change it later, e.g., for different batch sizes)
		net.blobs['data'].reshape(50, 3, 227, 227)

		while True:
			filename = self.has_image()
			if filename is not None and '' != filename:
				image_loaded_timestamp = time.time()
				image = caffe.io.load_image( self.waiting_path + filename )
				transformed_image = transformer.preprocess('data', image)

				# info = psutil.virtual_memory()
				# copy the image data into the memory allocated for the net
				net.blobs['data'].data[...] = transformed_image

				### perform classification
				output = net.forward()
				output_prob = output['prob'][0]

				label_index = str(output_prob.argmax())
				message = filename + ' output label index:' + label_index + '\n'

				ended_timestamp = time.time()
				message += 'recognition time = ' + str( int(ended_timestamp) - int(image_loaded_timestamp) ) + '\n\n'
				
				sys.stdout.write(message)
				sys.stdout.flush()

				# python2 use requests to send result in child process
				# todo: do the following in child process
				import requests, hashlib, math, json
				token = ''
				try:
					with open( os.path.join( BASE_DIR, 'token_key.txt' ) ) as f:
						token_key = f.read().strip()
						# key = token_key + str( math.floor( time.time() ) ) # python3: math.floor() == xxx
						key = token_key + str( int(math.floor( time.time() )) ) # python2: math.floor() == xxx.0
						token = hashlib.new('md5', key.encode("utf-8") ).hexdigest()
				except Exception as ex: # FileNotFoundError as ex: # python2 has no FileNotFoundError
					msg = ' cannot find file in _run method in DaemonCaffe class. ex = %s' % ex
					sys.stdout.write( msg )
					sys.stdout.flush()
				if token is not None and '' != token and label_index is not None and '' != label_index:
					# call uri
					get_path = domain_name + 'crontab/result/' + label_index + '/filename/' + filename + '/token/' + token
					# https://blog.csdn.net/gmq_syy/article/details/76855621
					# https://www.cnblogs.com/zhoug2020/p/5079407.html
					child_process = os.path.join( BASE_DIR, 'recognition/child.py' )
					args = ('python', child_process, get_path, filename, label_index)
					try:
						child = subprocess.Popen( args, stdin=sys.stdin, stdout=sys.stdout, stderr=sys.stderr )
					except subprocess.CalledProcessError as ex:
						msg = ' subprocess.CalledProcessError: fail to create child process in _run method in DaemonCaffe class. ex = %s' % ex
						sys.stdout.write( msg )
						sys.stdout.flush()
					except Exception as ex:
						msg = ' fail to create child process in _run method in DaemonCaffe class. ex = %s' % ex
						sys.stdout.write( msg )
						sys.stdout.flush()
				shutil.copyfile(self.waiting_path + filename, self.done_path + filename)
				os.remove(self.waiting_path + filename)
			else:
				time.sleep(0.2)

	def has_image(self):
		waiting_files = os.listdir( self.waiting_path )
		if 0 == len(waiting_files):
			return ''
		timestamp = None
		first_file = ''
		for one in waiting_files:
			file_path = os.path.join( self.waiting_path, one )
			if os.path.isfile( file_path ):
				fsize = os.path.getsize(file_path)
				if fsize is None or 0 == fsize:
					try:
						os.remove(file_path)
					except PermissionError as ex:
						sys.stderr.write('PermissionError: Inside has_image method of DaemonCaffe. ex = %s \n' % str(ex))
						sys.stderr.flush()
					except Exception as ex:
						sys.stderr.write('Exception: Inside has_image method of DaemonCaffe. ex = %s \n' % str(ex))
						sys.stderr.flush()
					continue
				temp = os.path.getctime(file_path)
				if timestamp is None or 0 < timestamp - os.path.getctime(file_path):
					timestamp = os.path.getctime(file_path)
					first_file = one
		return first_file

if __name__ == '__main__':
	stdout_caffe = log_root + 'caffe' + datetime.datetime.now().strftime('%Y%m%d') + '.log'
	stderr_caffe = log_root + 'caffe_error.log'
	stdout_console ='/dev/stdout'
	pid_file = tmp_root + 'daemon_recognition.pid'
	if len(sys.argv) == 2:
		daemon = DaemonCaffe( pid_file, stdin=stdout_console, stdout=stdout_caffe, stderr=stderr_caffe )
		if 'start' == sys.argv[1]:
			daemon.setApplicationName(sys.argv[0])
			daemon.start()
		elif 'stop' == sys.argv[1]:
			daemon.stop()
		elif 'restart' == sys.argv[1]:
			daemon.restart()
		elif 'status' == sys.argv[1]:
			daemon.status()
		else:
			sys.stdout.write( 'use: %s start|stop|restart|status' % sys.argv[0] )
			sys.stdout.flush()
			sys.exit(3)
	else:
		sys.stdout.write( 'use: %s start|stop|restart|status' % sys.argv[0] )
		sys.stdout.flush()
		sys.exit(2)

