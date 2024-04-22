#!/bin/bash

# Docker login
# Consider using a credential helper or environment variables for secure login
sudo docker login -u gowthamsharoon -p SHArj84KMF#

# Build the Docker image
sudo docker build -t guvi-app-prod .

# Tag the built image correctly
#sudo docker tag guvi-app-prod:latest gowthamsharoon/prod:latest
sudo docker tag guvi-app-prod:latest gowthamsharoon/prod:latest


# Push the tagged image to Docker Hub
#sudo docker push gowthamsharoon/prod:latest
sudo docker push gowthamsharoon/prod:latest


