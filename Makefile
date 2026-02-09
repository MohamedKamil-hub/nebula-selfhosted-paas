# Makefile for NEBULA - Self-Hosted PaaS Management
# Author: Mohamed Kamil
# Project: NEBULA

.PHONY: help up down restart logs ps stats backup security update prune shell-python

# Default target: Show help
help: ## Show this help message
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

# --- Docker Management ---
up: ## Start all services in detached mode
	@echo "Starting NEBULA services..."
	docker compose up -d

down: ## Stop and remove all containers and networks
	@echo "Stopping NEBULA services..."
	docker compose down

restart: ## Restart all services
	@echo "Restarting NEBULA..."
	docker compose restart

logs: ## Follow logs for all containers
	docker compose logs -f

ps: ## List running containers
	docker compose ps

stats: ## Show live resource usage (CPU/RAM)
	docker stats

# --- System & Security ---
security: ## Check UFW Firewall and Fail2Ban status
	@echo "--- Firewall Status (UFW) ---"
	sudo ufw status
	@echo ""
	@echo "--- Fail2Ban Status (SSHD Jail) ---"
	sudo fail2ban-client status sshd

backup: ## Run the automated backup script
	@echo "Starting Backup..."
	bash ./scripts/backup-nebula.sh

# --- Maintenance ---
update: ## Pull latest changes from Git and rebuild containers
	@echo "Updating project..."
	git pull origin main
	docker compose pull
	docker compose up -d --build
	@echo "Update complete."

prune: ## Clean up unused Docker images and volumes (Be careful!)
	docker system prune -f

# --- App Specific ---
shell-python: ## Open a shell inside the Python container
	docker compose exec nebula-python /bin/bash
