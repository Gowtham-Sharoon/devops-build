#!/bin/bash

sudo docker pull gowthamsharoon/prod:latest
sudo docker run -d -p 80:80 --name guvi-app gowthamsharoon/prod:latest



