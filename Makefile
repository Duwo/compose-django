# Make an application
include db.mk
migrate:
	docker-compose run accounts /app/manage.py migrate 
	docker-compose run jetty /app/manage.py migrate 
	docker-compose run portfolio /app/manage.py migrate 
	docker-compose run polls /app/manage.py migrate 

static:
	docker-compose run accounts /app/manage.py collectstatic --noinput
	docker-compose run jetty /app/manage.py collectstatic --noinput
	docker-compose run portfolio /app/manage.py collectstatic --noinput
	docker-compose run polls /app/manage.py collectstatic --noinput
	
initdb:
	docker-compose run \
	-e POSTGRES_USER=$(POSTGRES_USER) \
	-e POSTGRES_PASSWORD=$(POSTGRES_PASSWORD) \
	-e PGDATA=/var/lib/postgresql/data/$(PGDATA) \
	-e POSTGRES_DB=$(POSTGRES_DB) \
	-u postgres postgres initdb

superuser:
	docker-compose run portfolio /app/manage.py createsuperuser
	docker-compose run jetty /app/manage.py createsuperuser
	docker-compose run accounts /app/manage.py createsuperuser
	docker-compose run polls /app/manage.py createsuperuser
