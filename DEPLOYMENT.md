# MEAN Stack CRUD App - DevOps Deployment Guide

## Quick Setup

### 1. Repository Setup
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO.git
git push -u origin main
```

### 2. Docker Hub Setup
- Create account at hub.docker.com
- Create repositories: `mean-backend` and `mean-frontend`

### 3. GitHub Secrets Configuration
Add these secrets in GitHub repository settings:
- `DOCKER_USERNAME`: Your Docker Hub username
- `DOCKER_PASSWORD`: Your Docker Hub password
- `HOST`: Your VM IP address
- `USERNAME`: VM username (usually ubuntu)
- `SSH_KEY`: Your private SSH key for VM access

### 4. VM Deployment
```bash
# On your Ubuntu VM
wget https://raw.githubusercontent.com/YOUR_USERNAME/YOUR_REPO/main/deploy.sh
chmod +x deploy.sh
./deploy.sh
```

### 5. Local Development
```bash
docker-compose up -d
```

## Architecture
- **Frontend**: Angular 15 (Port 4200)
- **Backend**: Node.js/Express (Port 8080)
- **Database**: MongoDB (Port 27017)
- **Reverse Proxy**: Nginx (Port 80)

## CI/CD Pipeline
- Triggers on push to main branch
- Builds and pushes Docker images
- Automatically deploys to VM

## Access
- Application: http://YOUR_VM_IP
- API: http://YOUR_VM_IP/api