#!/bin/bash

# Tag the built image correctly
docker tag guvi-app-prod gowthamsharoon/prod:latest

# Docker push to prod repo on Docker Hub
sudo docker push gowthamsharoon/prod

