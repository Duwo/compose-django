# Make an application
config:
	-sed -i -e '/DEBUG*/,$d' mysite/mysite/settings.py
	cat config_templates/apps_template >> mysite/mysite/settings.py
	cat config_templates/static_template >> mysite/mysite/settings.py
	cat config_templates/url_template >> mysite/mysite/urls.py

	mv mysite uwsgi/mysite

collect: clean
	cp ../induwo_site/dist/* uwsgi/my_requirements/ ;\
	cp ../induwo_registration/dist/*.tar.gz uwsgi/my_requirements/ ;\
	cp ../polls/dist/*.tar.gz uwsgi/my_requirements/ ;\
	cp ../jetty/dist/*.tar.gz  uwsgi/my_requirements/ ;\

migrate:
	docker-compose run uwsgi app/manage.py migrate
