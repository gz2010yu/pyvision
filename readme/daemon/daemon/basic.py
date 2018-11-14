# !/usr/bin/env python
# coding: utf-8

# Author: https://www.cnblogs.com/yunxizhujing/p/9382342.html
# a python class to mimic the daemon on linux

import sys, os, time, atexit, string, datetime
from signal import SIGTERM

Daemon_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

__metaclass__ = type
# https://blog.csdn.net/wanghai__/article/details/6859367

class Daemon:
	def __init__(self, pidfile="/tmp/Daemon.pid", stdin='/dev/null', stdout='/dev/null', stderr='/dev/null'):
		# for debug, use stdin='/dev/stdin', stdout='/dev/stdout', stderr='/dev/stderr' and run as root
		self.stdin = stdin
		self.stdout = stdout
		self.stderr = stderr
		self.pidfile = pidfile
		self.applicationName = "Application"
		self._homeDir = os.path.join( Daemon_DIR, '../' )  # "/local/recognition"
		# whether debug mode is True
		self._verbose = False
		# user mask
		self._umask = 0

	# get daemon mask
	@property
	def umask(self):
		return self._umask

	# set daemon mask
	@umask.setter
	def umask(self, umask):
		self._umask = umask

	# get debug mode
	@property
	def VerboseMode(self):
		return self._verbose

	# set debug mode
	@VerboseMode.setter
	def VerboseMode(self, verboseMode):
		self._verbose = verboseMode

	# switch the io dev according to debug mode
	def _verbosSwitch(self):
		# debug mode will stdout to files when initializing
		if self._verbose:
			pass
			# self.stdin = '/dev/stdin'
			# self.stdout = '/dev/stdout'
			# self.stderr = '/dev/stderr'
		else:
			self.stdin = '/dev/null'
			self.stdout = '/dev/null'
			self.stderr = '/dev/null'

	def setApplicationName(self, appName):
		self.applicationName = appName

	# get home dir
	@property
	def HomeDir(self):
		return self._homeDir

	@HomeDir.setter
	def HomeDir(self, homeDir):
		self._homeDir = homeDir

	# to create a grandson process and leave the parent and child processes
	def _daemonize(self):
		# Step 1
		now_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
		try:
			# the first fork to generate the child process. PID == 0 indicates that now is inside child process
			# PID > 0 indicates now is inside parent process
			# The code will be called twice: one by parent process and the other by child process
			pid = os.fork()
			if pid > 0:
				# Now is inside parent process; exit parent process and child process will be taken over by Linux init
				sys.stderr.write( '[ ' + now_time + ' ] fork #1 succeeded: pid = %d\n' % pid )
				sys.exit(0)
		except OSError as e:
			sys.stderr.write( '[ ' + now_time + ' ] fork #1 failed: %d (%s)\n' % (e.errno, e.strerror) )
			sys.exit(1)

		# Steps 2, 3, 4
		os.chdir(self._homeDir)		# Set home dir
		os.setsid()					# set new session, child process will be the first process of this session
									# also a new process group will be generated having the same group id as session id
		os.umask(self._umask)		# reset file permission, i.e., the umask of home dir

		# Step 5
		now_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
		try:
			# the second fork to generate the grandchild process. PID == 0 indicates that now is inside grandchild process
			# PID > 0 indicates now is inside child process
			pid = os.fork()
			if pid > 0:
				# Now is inside child process; exit child process and grandchild process will be taken over by Linux init
				sys.stderr.write( '[ ' + now_time + ' ] fork #2 succeeded: pid = %d\n' % pid )
				sys.exit(0)
		except OSError as e:
			sys.stderr.write( '[ ' + now_time + ' ] fork #2 failed: %d (%s)\n' % (e.errno, e.strerror) )
			sys.exit(1)

		# Step 6: save to hard drive
		sys.stdout.flush()
		sys.stderr.flush()
		# redirect file descriptor(FD)
		changed = False
		if os.path.isfile( self.stdout ):
			os.chown(self.stdout, 33, 33)
			changed = True
		with open(self.stdout, 'a+') as so:
			if not changed:
				os.chown(self.stdout, 33, 33)
			os.dup2(so.fileno(), sys.stdout.fileno())
		
		changed = False
		if os.path.isfile( self.stderr ):
			os.chown(self.stderr, 33, 33)
			changed = True
		with open(self.stderr, 'a+') as se:
			# good for python3
			# se = open(self.stderr, 'a+', 0) # ValueError: can't have unbuffered text I/O
			if not changed:
				os.chown(self.stderr, 33, 33)
			os.dup2(se.fileno(), sys.stderr.fileno())
		
		if os.path.isfile( self.stdin ):
			os.chown(self.stdin, 33, 33)
		si = open(self.stdin, 'r')
		# os.dup2 can atomize the opened FD and copy it; OK on Linux and Windows
		# File.fileno() method return an integer as file descriptor
		os.dup2(si.fileno(), sys.stdin.fileno())

		# register the function below means that when you run python2 example1daemon.py stop
		# the pidfile will be deleted.
		atexit.register(self.delpid)
		pid = str(os.getpid())
		with open(self.pidfile, 'w+') as f:
			os.chown(self.pidfile, 33, 33)
			f.write('%s\n' % pid)

	# execute command python2 example1daemon.py stop
	# will delete the pid file
	def delpid(self):
		os.remove(self.pidfile)

	def start(self, *args, **kwargs):
		# check if the pidfile exists
		try:
			pid = self._getPid()
		except IOError:
			pid = None

		# if pid is not None and 0 < pid, daemon is running
		if pid:
			now_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
			message = '[ ' + now_time + ' ] pidfile %s already exist. Process already running!\n'
			sys.stderr.write(message % self.pidfile)
			sys.exit(1)

		# construct grandchild process
		self._daemonize()
		# load payloads
		self._run(*args, **kwargs)

	def stop(self):
		# get pid from pidfile
		try:
			pid = self._getPid()
		except IOError:
			pid = None
		now_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
		# daemon was not running
		if not pid:
			message = '[ ' + now_time + ' ] pidfile %s does not exist. Process not running!\n'
			sys.stderr.write(message % self.pidfile)
			sys.stderr.flush()
			return

		# kill the daemon
		try:
			while 1:
				os.kill(pid, SIGTERM)
				time.sleep(0.1)
				message = '[ ' + now_time + ' ] Process is stopped.\n'
				sys.stderr.write(message)
				sys.stderr.flush()
		except OSError as err:
			err = str(err)
			if err.find('No such process') > 0:
				if os.path.exists(self.pidfile):
					os.remove(self.pidfile)
			else:
				sys.stderr.write( str(err) )
				sys.stderr.flush()
				sys.exit(1)

	# get PID
	def _getPid(self):
		try:
			# read pidfile
			pf = open(self.pidfile, 'r')
			pid = int(pf.read().strip())
			pf.close()
		except IOError:
			pid = None
		except SystemExit:
			pid = None
		return pid

	# kill previous process and then start a new one
	def restart(self, *args, **kwargs):
		self.stop()
		self.start(*args, **kwargs)

	# get daemon process status
	def status(self):
		try:
			pid = self._getPid()
		except IOError:
			pid = None

		if not pid:
			message = "No such a process running.\n"
			sys.stderr.write(message)
		else:
			message = "The process is running, PID is %s .\n"
			sys.stderr.write(message % str(pid))

	def _run(self, *args, **kwargs):
		"""
		here is inside grandchild process. You can override this method for your own logic
		"""
		while True:
			now_time = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
			sys.stdout.write('%s:Inside Daemon\n' % (now_time,))
			sys.stdout.flush()
			time.sleep(60)
