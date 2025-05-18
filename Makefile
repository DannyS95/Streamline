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
.PHONY: help build up down restart logs backend-logs frontend-logs db-logs redis-logs

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
	@echo "  make migrate          Apply database migrations"
	@echo "  make createsuperuser  Create a Django superuser"
	@echo "  make shell            Open a Django shell inside the backend container"
	@echo "  make collectstatic    Collect static files"

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
	docker-compose exec $(BACKEND) python manage.py migrate

createsuperuser:
	docker-compose exec $(BACKEND) python manage.py createsuperuser

shell:
	docker-compose exec $(BACKEND) python manage.py shell

collectstatic:
	docker-compose exec $(BACKEND) python manage.py collectstatic --noinput
