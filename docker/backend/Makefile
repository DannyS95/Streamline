# ========================
# Docker Variables
# ========================
DOCKER_COMPOSE := docker-compose
DOCKER_EXEC := $(DOCKER_COMPOSE) exec
BACKEND := backend
DB := db

# ========================
# Docker Commands
# ========================
up:
	$(DOCKER_COMPOSE) up --build -d

down:
	$(DOCKER_COMPOSE) down

restart:
	$(DOCKER_COMPOSE) down && $(DOCKER_COMPOSE) up --build -d

logs:
	$(DOCKER_EXEC) $(BACKEND) tail -f /app/logs/*.log

shell:
	$(DOCKER_EXEC) $(BACKEND) bash

# ========================
# Django Commands
# ========================
migrate:
	$(DOCKER_EXEC) $(BACKEND) python manage.py migrate

makemigrations:
	$(DOCKER_EXEC) $(BACKEND) python manage.py makemigrations

superuser:
	$(DOCKER_EXEC) $(BACKEND) python manage.py createsuperuser

collectstatic:
	$(DOCKER_EXEC) $(BACKEND) python manage.py collectstatic --no-input

test:
	$(DOCKER_EXEC) $(BACKEND) python manage.py test

# ========================
# Database Commands
# ========================
psql:
	$(DOCKER_EXEC) $(DB) psql -U user -d youtube

# ========================
# Utilities
# ========================
rebuild:
	$(DOCKER_COMPOSE) up --build --force-recreate -d

stop:
	$(DOCKER_COMPOSE) stop

start:
	$(DOCKER_COMPOSE) start

clean:
	$(DOCKER_COMPOSE) down -v --remove-orphans
