FROM python:3.4
RUN groupadd -r uwsgi && useradd -r -g uwsgi uwsgi

ADD /requirements.txt /requirements.txt
ADD /my_requirements.txt /my_requirements.txt
ADD /my_requirements /my_requirements

RUN pip install -r /requirements.txt
RUN pip install -r /my_requirements.txt --no-index --find-links file:///my_requirements

ADD /mysite /app/
RUN chown -R uwsgi /app
RUN chown -R uwsgi /media
ADD uwsgi.sh /uwsgi.sh
RUN chmod +x /uwsgi.sh

ADD /mysite/mysite/settings.py /app//settings.py