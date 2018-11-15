# !/usr/bin/env python
# coding: utf-8

import sys, time, datetime, os, logging
import shutil
import logging.handlers # this line cannot be deleted

# config = {}
# logging.config.dictConfig(config)

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
recognition_root = BASE_DIR + '/recognition/'
log_root = BASE_DIR + '/log/recognition/'
tmp_root = os.path.join( recognition_root, 'tmp/' )
domain_name = 'https://www.your_domain.com'
LABEL_LENGTH = 999 # if you are using other trained caffe model, you may need to change this.

from daemon.basic import Daemon

def set_logger():
	# Author: https://docs.python.org/3/howto/logging-cookbook.html#logging-cookbook
	today = datetime.datetime.now().strftime('%Y%m%d')
	LOG_FILENAME = log_root + 'daemon' + today + '.log'

	daemon_logger = logging.getLogger('DaemonLog')
	daemon_logger.setLevel(logging.INFO)

	# Add the log message handler to the logger
	handler = logging.handlers.RotatingFileHandler(LOG_FILENAME, 'a', maxBytes=2097152, backupCount=1000, encoding='utf-8')
	# handler.rotator = rotator # rotator is a self defined function for rotating log files
	# handler.namer = namer # namer is a self defined function for naming previous log files
	# by using the above 2 self defined functions, you can log to different files according to date

	daemon_format = logging.Formatter('[ %(levelname)s ] [ %(asctime)s ] %(message)s')
	# %(name)s %(processName)-10s pid = %(process)s thread_id = %(thread)s 
	# DaemonLog MainProcess pid = 4604 thread_id = 16152
	handler.setFormatter(daemon_format)

	daemon_logger.addHandler(handler)
	return daemon_logger

daemon_logger = set_logger()
DaemonPyvision_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

class DaemonCaffe(Daemon):
	signal_file = recognition_root + 'signals/current_filename.txt'
	waiting_path = recognition_root + 'images_waiting/'
	done_path = recognition_root + 'images_done/'
	result_path = recognition_root + 'results/'

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
			if filename is not None:
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
				
				# daemon_logger.info(message)
				# these 2 processes will use different log files
				sys.stdout.write(message)
				sys.stdout.flush()

				# python2 has no encoding='utf-8' parameter
				with open(self.result_path + filename, 'w+') as f:
					os.chown( self.result_path + filename, 33, 33)
					f.write( label_index )
				shutil.copyfile(self.waiting_path + filename, self.done_path + filename)
				os.remove(self.signal_file)
				os.remove(self.waiting_path + filename)
			else:
				time.sleep(2)

	def has_image(self):
		try:
			with open(self.signal_file, 'rt') as f:
				# python2 has no encoding='utf-8' parameter
				filename = f.read().strip()
				if 1 > len(filename):
					f.close()
					os.remove(self.signal_file)
					return None
				if not os.path.isfile( self.waiting_path + filename ):
					f.close()
					os.remove(self.signal_file)
					return None
				return filename
		except IOError as ex: # python2 has no FileNotFoundError
			# no payload, just keep checking in every 2 seconds
			return None
		except Exception as ex:
			# daemon_logger.error( '%s: Inside has_image method of DaemonCaffe. \n' % (ex,) )
			sys.stderr.write('%s: Inside has_image method of DaemonCaffe. \n' % (ex,))
			sys.stderr.flush()
			return None

class PooledMySQL(object):
	"""docstring for PooledMySQL
	use DBUtils.PooledDB.PooledDB for ensuring a more stable db connection
	"""
	database = os.environ.get('MYSQL_DB_SHARE')
	user = os.environ.get('MYSQL_USER_SHARE')
	password = os.environ.get('MYSQL_PASS_SHARE')
	host = os.environ.get('MYSQL_HOST')
	conn = None
	pooled = None

	def __init__(self):
		# super(PooledMySQL, self).__init__()
		import MySQLdb
		from DBUtils.PooledDB import PooledDB
		self.connargs = { "host":self.host,"user":self.user,"passwd":self.password,"db":self.database,"port":3306,"charset":"utf8" }
		self.pooled = PooledDB(MySQLdb, **self.connargs)

	def connection(self):
		self.conn = self.pooled.connection()
		return self.conn

	def close(self):
		if self.conn is not None:
			self.conn.close()

	def get_cursor(self):
		self.conn = self.pooled.connection()
		return self.conn.cursor()

class DaemonPyvision(Daemon):
	signal_file = recognition_root + 'signals/current_filename.txt'
	waiting_path = recognition_root + 'images_waiting/'
	done_path = recognition_root + 'images_done/'
	result_path = recognition_root + 'results/'

	def check_sequene(self):
		file_name = ''
		# image_id = 0
		sql = "SELECT * FROM basic_imagerecognitionsequene ORDER BY sequene_id ASC LIMIT 1"
		try:
			pooled = PooledMySQL()
			cursor = pooled.get_cursor()
			count = cursor.execute(sql)
			temp = cursor.fetchone()
			if temp is not None:
				file_name = temp[1]
				# image_id = temp[2]
		except Exception as ex:
			msg = ' PooledMySQL returns wrong response in check_sequene method in DaemonPyvision class: '
			msg += 'sql = '+ sql + '. Exception = ' + str(ex)
			daemon_logger.error( msg )
		finally:
			pooled.close()
			# use mysql db pool. close the pool conn right after each usage
		return file_name

	def check_result_files(self):
		# check result files
		files_dirs = os.listdir(self.result_path)
		if 0 == len(files_dirs):
			return False

		for one in files_dirs:
			file_path = os.path.join( self.result_path, one )
			if os.path.isfile( file_path ):
				try:
					with open( file_path, 'rt' ) as f:
						result = int( f.read() )
						if 0 > result or LABEL_LENGTH < result:
							# only log such an error and will delete result files as well
							msg = ' Error in check_result_files method in DaemonPyvision class: Out of range! '
							msg += 'file path = ' + file_path + '. recognition result = ' + str(result)
							daemon_logger.error( msg )
						else:
							sql = "SELECT * FROM basic_imagerecognitionsequene WHERE file_name=\"" + one + "\""
							image_id = 0
							sequene_id = 0
							temp = None
							try:
								pooled = PooledMySQL()
								cursor = pooled.get_cursor()
								cursor.execute(sql)
								temp = cursor.fetchone()
							except Exception as ex:
								msg = ' PooledMySQL returns wrong response in check_result_files method in DaemonPyvision class: '
								msg += 'sql = '+ sql + '. Exception = ' + str(ex)
								daemon_logger.error( msg )
							finally:
								pooled.close()
							
							if temp is not None:
								sequene_id = temp[0]
								image_id = temp[2]
							if 0 < image_id:
								sql = "SELECT label FROM basic_synsetwords WHERE word_id=" + str(1+result)
								label = ''
								count = -1
								try:
									pooled = PooledMySQL()
									cursor = pooled.get_cursor()
									cursor.execute(sql)
									temp = cursor.fetchone()
									if temp is not None:
										label = temp[0]
								except Exception as ex:
									msg = ' PooledMySQL returns wrong response in check_result_files method in DaemonPyvision class: '
									msg += 'sql = '+ sql + '. Exception = ' + str(ex)
									daemon_logger.error( msg )
								finally:
									pooled.close()
								if '' == label:
									msg = ' No record found in Table basic_synsetwords in check_result_files method in DaemonPyvision class: '
									msg += 'sql = '+ sql
									daemon_logger.error( msg )
								else:
									count = 0
									if 0 < label.count('"'):
										new = label.replace("'", "''")
										sql='''UPDATE basic_image SET recognized='%s', recognized_time=SYSDATE() where image_id="%s"''' % (new, image_id)
									else:
										sql='UPDATE basic_image SET recognized="%s", recognized_time=SYSDATE() where image_id="%s"' % (label, image_id)
									try:
										pooled = PooledMySQL()
										cursor = pooled.get_cursor()
										count = cursor.execute(sql)
										pooled.conn.commit()
									except Exception as ex:
										msg = ' PooledMySQL returns wrong response in check_result_files method in DaemonPyvision class: '
										msg += 'sql = '+ sql + '. Exception = ' + str(ex)
										daemon_logger.error( msg )
									finally:
										pooled.close()
								if 0 == count:
									msg = ' PooledMySQL failed to update Table basic_image in check_result_files method in DaemonPyvision class: '
									msg += 'sql = '+ sql + '. Exception = ' + str(ex)
									daemon_logger.error( msg )
								sql = "DELETE FROM basic_imagerecognitionsequene WHERE sequene_id=" + str(sequene_id)
								try:
									pooled = PooledMySQL()
									cursor = pooled.get_cursor()
									count = cursor.execute(sql)
									pooled.conn.commit()
								except Exception as ex:
									msg = ' PooledMySQL failed to delete one record in Table basic_imagerecognitionsequene in check_result_files method in DaemonPyvision class: '
									msg += 'sql = '+ sql + '. Exception = ' + str(ex)
									daemon_logger.error( msg )
								finally:
									pooled.close()
							else:
								msg = ' cannot find sequene record from Table basic_imagerecognitionsequene in check_result_files method in DaemonPyvision class. '
								msg += 'sql = ' + sql
								daemon_logger.error( msg )
						os.remove( file_path )
				except FileNotFoundError as ex:
					daemon_logger.error( ' FileNotFoundError in check_result_files method in DaemonPyvision class: file path = ' + file_path )
				except Exception as ex:
					daemon_logger.error( ' Exception in check_result_files method in DaemonPyvision class: ex = ' + str(ex) )
		return True

	# override _run method of parent class Daemon
	def _run(self, *args, **kwargs):
		image_file_name = ''
		while True:
			if '' == image_file_name:
				image_file_name = self.check_sequene()
			check_result = self.check_result_files()
			if '' == image_file_name:
				# has no result files nor images for recognition
				time.sleep(5)
			elif os.path.isfile( self.signal_file ):
				# caffe is running to recognize other images
				time.sleep(2)
			else:
				# has images(an image) for recognition
				try:
					with open(self.signal_file, 'w+') as f:
						os.chown( self.signal_file, 33, 33)
						f.write( image_file_name )
						image_file_name = ''
				except Exception as ex:
					daemon_logger.error( ' Error in writing signal_file %s: Inside _run method of DaemonPyvision. %s \n' % (self.signal_file, str(ex), ) )

if __name__ == '__main__':
	supported_classes = ['DaemonCaffe', 'DaemonPyvision', ]
	stdout_caffe = log_root + 'caffe' + datetime.datetime.now().strftime('%Y%m%d') + '.log'
	stdout_file = log_root + 'daemon' + datetime.datetime.now().strftime('%Y%m%d') + '.log'
	stderr_caffe = log_root + 'caffe_error.log'
	stderr_file = log_root + 'daemon_error.log'
	stdout_console ='/dev/stdout'
	if len(sys.argv) == 3:
		if sys.argv[2] is None or '' == str(sys.argv[2]):
			sys.stdout.write( 'DaemonCaffe usage: %s start|stop|restart|status DaemonCaffe' % sys.argv[0] )
			sys.stdout.write( 'DaemonPyvision usage: %s start|stop|restart|status DaemonPyvision' % sys.argv[0] )
			sys.stdout.write( 'class_name (DaemonCaffe or DaemonPyvision) was not found' )
			sys.stdout.flush()
			sys.exit(3)
		class_name = str(sys.argv[2])
		pid_file = ''
		if 'DaemonCaffe' == class_name:
			pid_file = tmp_root + 'daemon_recognition.pid'
			daemon = DaemonCaffe( pid_file, stdin=stdout_console, stdout=stdout_caffe, stderr=stderr_caffe )
		elif 'DaemonPyvision' == class_name:
			pid_file = tmp_root + 'daemon_waiting.pid'
			daemon = DaemonPyvision( pid_file, stdin=stdout_console, stdout=stdout_file, stderr=stderr_file )
		if pid_file is None or '' == pid_file:
			class_string = ''
			for one in supported_classes:
				class_string += (one + ', ')
			sys.stdout.write( 'usage: %s start|stop|restart|status class_name' % sys.argv[0] )
			sys.stdout.write( 'class_name should only be one of ( ' + class_string + ' ).' )
			sys.stdout.flush()
			sys.exit(3)
		else:
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
				sys.stdout.write( 'unknown command' )
				sys.stdout.flush()
				sys.exit(2)
		sys.exit(0)
	else:
		sys.stdout.write( 'DaemonCaffe usage: %s start|stop|restart|status DaemonCaffe' % sys.argv[0] )
		sys.stdout.write( 'DaemonPyvision usage: %s start|stop|restart|status DaemonPyvision' % sys.argv[0] )
		sys.stdout.flush()
		sys.exit(2)

