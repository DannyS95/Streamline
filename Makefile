# ========================
#     Container Names
# ========================
FRONTEND = frontend
BACKEND = backend
DB = db
REDIS = redis

# ========================
#     Docker Commands
# ========================
.PHONY: help build up down restart logs backend-logs frontend-logs db-logs redis-logs backend-sh frontend-sh db-sh redis-sh migrate makemigrations shell

help:
	@echo "Available commands:"
	@echo ""
	@echo "Docker Management:"
	@echo "  make build            Build all Docker containers"
	@echo "  make up               Start all Docker containers"
	@echo "  make down             Stop all Docker containers"
	@echo "  make restart          Restart all Docker containers"
	@echo "  make logs             Display logs for all services"
	@echo ""
	@echo "Service Logs:"
	@echo "  make backend-logs     Display logs for the backend service"
	@echo "  make frontend-logs    Display logs for the frontend service"
	@echo "  make db-logs          Display logs for the database"
	@echo "  make redis-logs       Display logs for the Redis service"
	@echo ""
	@echo "Django Management:"
	@echo "  make migrate app=videos          Apply database migrations for a specific app"
	@echo "  make makemigrations app=videos   Generate migrations for a specific app"
	@echo "  make shell                       Open a Django shell inside the backend container"
	@echo "  make collectstatic               Collect static files"
	@echo ""
	@echo "Container Shell Access:"
	@echo "  make backend-sh                  Open a shell inside the backend container"
	@echo "  make frontend-sh                 Open a shell inside the frontend container"
	@echo "  make db-sh                       Open a shell inside the database container"
	@echo "  make redis-sh                    Open a shell inside the Redis container"

# Docker Management
build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

restart:
	docker-compose down && docker-compose up -d

logs:
	docker-compose logs -f

# ========================
#     Service Logs
# ========================
backend-logs:
	docker-compose logs -f $(BACKEND)

frontend-logs:
	docker-compose logs -f $(FRONTEND)

db-logs:
	docker-compose logs -f $(DB)

redis-logs:
	docker-compose logs -f $(REDIS)

# ========================
#     Django Management
# ========================
migrate:
	docker-compose exec $(BACKEND) python manage.py migrate $(app)

makemigrations:
	docker-compose exec $(BACKEND) python manage.py makemigrations $(app)

createsuperuser:
	docker-compose exec $(BACKEND) python manage.py createsuperuser

shell:
	docker-compose exec $(BACKEND) python manage.py shell

collectstatic:
	docker-compose exec $(BACKEND) python manage.py collectstatic --noinput

# ========================
#    Container Shell Access
# ========================
backend-sh:
	docker-compose exec $(BACKEND) $(if $(arg),$(arg),/bin/bash)

frontend-sh:
	docker-compose exec $(FRONTEND) /bin/sh

db-sh:
	docker-compose exec backend psql -h db -U user -d youtube

redis-sh:
	docker-compose exec $(REDIS) redis-cli
