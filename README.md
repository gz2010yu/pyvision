# pyvision3

This is an open source python/django project for image recognition using caffe framework. The current 0.1.0 version is coded using Python 3.7.1 and Django 2.1.2. The example demo is on https://www.mutualact.top. As of 2018-11-13, the demo has only image uploading function. Peter will do the caffe part in 3 days. The sina dockers have only 512 MB + 2 GB memory and it takes 8 to 15 seconds for recognizing one single image. Upon deploying this app on Microsoft Azure Virtual Machine, it will only take 100 ms for one recognition. However Azure will charge about USD $5 for renting that Virtual Machine (16GB memory, 8-core CPU, without GPU, SSD disk). The current trained model was the Champion winner in 2012 ImageNet Competition. 

For SQL commands, you can use the MySQL statements provided (/sae/readme/database.sql) or use Django commands (python ./manage.py makemigrations and then python ./manage.py migrate). If you use Django commands, do not forget to insert 1000 records into Table basic_synsetwords, check the /sae/readme/database.sql file.

For secret key files, please check the /sae/readme/*.example files. However, if you are not using Sina Cloud Server, you may need to change all of these files according to your server environment.

For internationalization, you can use Django commands (python ./manage.py makemessages -l zh_Hans and then python ./manage.py compilemessages). If you added any new words for translation, before running the compilemessages command, you may want to check the path-to-your-project/common_files/locale/zh_Hans/LC_MESSAGES/django.po file

The daemon.py file contains two classes, one for signaling the other daemon process for image recognition and updating database tables, the other for conducting the image recognition. The second daemon process will have a caffe trained model loaded in memory (above 700 MB). When conducting the image recognition, about 1.5 GB memory is needed. It is recommended NOT to run two or more image recognition processes simultaneously, otherwise your server memory will be dried out.
