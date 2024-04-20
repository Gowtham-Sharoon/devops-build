#!/bin/bash

sudo docker pull gowthamsharoon/dev:latest
sudo docker stop guvi-app
sudo docker rm guvi-app
sudo docker run -d -p 80:80 --name guvi-app gowthamsharoon/dev:latest


#sudo docker pull gowthamsharoon/dev:latest
#sudo docker-compose up -d



#deploy file here helps to deploy the image to server from docker hub.

