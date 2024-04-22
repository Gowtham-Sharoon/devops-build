#!/bin/bash

docker tag guvi-app-prod gowthamsharoon/prod:latest

sudo docker push gowthamsharoon/prod

# Here I'm simply taging the build image, and pushing it to prod repo, Since it is pushed from our master branch.
