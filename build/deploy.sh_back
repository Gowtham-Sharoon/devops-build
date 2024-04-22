#!/bin/bash

sudo docker pull gowthamsharoon/prod
sudo docker stop guvi-app-prd
sudo docker rm guvi-app-prod
sudo docker run -d -p 80:80 --name guvi-app gowthamsharoon/prod


#sudo docker pull gowthamsharoon/dev:latest
#sudo docker-compose up -d



#deploy file here helps to deploy the image to server from docker hub.

