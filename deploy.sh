#!/bin/bash

# Server deployment script
# Run this on your Ubuntu VM

# Update system
sudo apt update && sudo apt upgrade -y

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Create app directory
mkdir -p /home/ubuntu/mean-app
cd /home/ubuntu/mean-app

# Download production files
wget https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/docker-compose.prod.yml -O docker-compose.yml
wget https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/nginx/nginx.conf

# Set environment variables
export DOCKER_USERNAME=your_docker_username

# Start services
docker-compose up -d

echo "Deployment complete! Application available on port 80"