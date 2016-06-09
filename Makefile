# Make an application
create_app:
	django-admin startproject mysite 

config: #create_app
	#sed -i -e '/DEBUG*/,$d' mysite/mysite/settings.py
	cat config_templates/apps_template >> mysite/mysite/settings.py
	cat config_templates/static_template >> mysite/mysite/settings.py
	cat config_templates/url_template >> mysite/mysite/urls.py
	mv mysite uwsgi/mysite

collect_mine:
	cp ../site/dist/* uwsgi/my_requirements/ ;\
	cp ../registration/dist/*.tar.gz uwsgi/my_requirements/ ;\
	cp ../polls/dist/*.tar.gz uwsgi/my_requirements/ ;\
	cp ../jetty/dist/*.tar.gz  uwsgi/my_requirements/ ;\

collect_py:
	pip --download uwsgi/requirements.txt
	cp -r Downloads/requirements uwsgi/requirements

migrate:
	docker-compose run uwsgi app/manage.py migrate
