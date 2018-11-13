# pyvision3

This is an open source python/django project for image recognition using caffe framework. The current 0.1.0 version is coded using Python 3.7.1 and Django 2.1.2. The example demo is on https://www.mutualact.top. As of 2018-11-13, the demo has only image uploading function. Peter will do the caffe part in two days. 

For SQL commands, you can use the MySQL command lines provided or use Django commands (python ./manage.py makemigrations and then python ./manage.py migrate)

For internationalization, you can use Django commands (python ./manage.py makemessages -l zh_Hans and then python ./manage.py compilemessages). If you added any new words for translation, before running the compilemessages command, you may want to check the path-to-your-project/common_files/locale/zh_Hans/LC_MESSAGES/django.po file

The daemon.py file contains two classes, one for signaling the other daemon process for image recognition and updating database tables, the other for conducting the image recognition. The second daemon process will have a caffe trained model loaded in memory (above 700 MB). When conducting the image recognition, about 1.5 GB memory is needed. It is recommended NOT to run two or more image recognition processes simultaneously, otherwise your server memory will be dried out.
