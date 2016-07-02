# Make an application
include db.mk
migrate:
	docker-compose run uwsgi_auth /app/manage.py migrate 
	docker-compose run uwsgi_jetty /app/manage.py migrate 
	docker-compose run uwsgi_portfolio /app/manage.py migrate 

static:
	docker-compose run uwsgi /app/manage.py collectstatic --noinput
	
initdb:
	docker-compose run \
	-e POSTGRES_USER=$(POSTGRES_USER) \
	-e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
	-e PGDATA=/var/lib/postgresql/data/$(PGDATA) \
	-e POSTGRES_DB=$(POSTGRES_DB) \
	-u postgres postgres initdb
