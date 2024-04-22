#!/bin/bash

docker tag guvi-app-prod gowthamsharoon/dev:latest

sudo docker push gowthamsharoon/dev


# Here simply taging the build & pushing to the dev repo, And this task will be performed by dev branch only.
