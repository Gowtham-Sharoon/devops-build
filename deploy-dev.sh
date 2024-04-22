#!/bin/bash

# Tag the built image correctly
docker tag guvi-app-prod gowthamsharoon/dev:latest

# Docker Push to Dev repo on Docker HUb
sudo docker push gowthamsharoon/dev
