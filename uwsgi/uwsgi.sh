#!/bin/sh
chown -R uwsgi /media
su -m uwsgi -c "/usr/local/bin/uwsgi --ini /mysite.ini"