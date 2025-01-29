#!/bin/bash


whoami
sudo apt update
sudo apt install git -y
git pull https://github.com/krishnansai/docker-test.git
cp -R * docker-test/* .
sudo docker build . -t 145023104074.dkr.ecr.us-east-1.amazonaws.com/mytestimage
sudo aws ecr get-login-password --region us-esat-1 | docker login --usernameAWS --password-stdin 145023104074.dkr.ecr.us-east-1.amazonaws.com
sudo docker push 145023104074.dkr.ecr.us-east-1.amazonaws.com/mytestimage
sudo docker run -d -p 80:80 145023104074.dkr.ecr.us-east-1.amazonaws.com/mytestimage
