#!/bin/bash

#docker logins,
sudo docker login -u gowthamsharoon -p SHArj84KMF#

sudo docker build -t guvi-app-dev .

sudo docker tag guvi-app-dev:latest gowthamsharoon/dev:latest

sudo docker push gowthamsharoon/dev:latest

#build file here used to build docker image.


