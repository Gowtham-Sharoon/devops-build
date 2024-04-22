#!/bin/bash

service docker restart

sudo docker login -u gowthamsharoon -p SHArj84KMF# docker.io

sudo docker build -t guvi-app-prod .

# simplying building the given sourcecode.
