#!/bin/bash

#docker logins,
sudo docker login -u gowthamsharoon -p SHArj84KMF#

sudo docker build -t guvi-app-prod .

sudo docker tag guvi-app-prod:latest gowthamsharoon/prod:latest

sudo docker push gowthamsharoon/prod:latest

#build file here used to build docker image.


