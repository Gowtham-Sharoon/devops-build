#!/bin/bash

sudo docker pull gowthamsharoon/dev:latest

sudo docker run -d -p 80:80 --name guvi-app gowthamsharoon/prod:latest


#Here just pulling the image from docker hub and running it on a remote server using port 80.

