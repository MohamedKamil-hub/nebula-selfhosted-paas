#!/bin/bash
# scripts/install-docker.sh
echo "=== NEBULA DOCKER INSTALLATION ==="

# Initial Preparation
sudo apt update
sudo apt install -y ca-certificates curl

# Agregar repositorio Docker
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# verify installation
docker --version

# configure user (without sudo)
dockeruser=$(whoami)

sudo usermod -aG docker $dockeruser
newgrp docker
docker ps

# verify Docker Compose
docker compose version





