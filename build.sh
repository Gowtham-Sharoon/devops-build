#!/bin/bash

# Docker service restart
service docker restart

# Docker login
# Consider using a credential helper or environment variables for secure login
sudo docker login -u gowthamsharoon -p SHArj84KMF# docker.io

# Build the Docker image
sudo docker build -t guvi-app-prod .

# Tag the built image correctly
docker tag guvi-app-prod gowthamsharoon/prod:latest

# Push the tagged image to Docker Hub
#sudo docker push gowthamsharoon/prod:latest
sudo docker push gowthamsharoon/prod:latest

