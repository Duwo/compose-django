#!/bin/sh
chown -R uwsgi /media
su -m uwsgi -c "/usr/local/bin/uwsgi --socket :5000 --wsgi-file /app/mysite/wsgi.py --master --processes 4 --threads 2 --chdir /app"
