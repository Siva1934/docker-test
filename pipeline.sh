#!/bin/bash

whoami
sudo apt update
sudo apt install git -y 
pwd
rm -rf *
git clone https://github.com/krishnansai/docker-test.git
ls
cp -R docker-test/* .
ls
sudo docker build . -t 199316303204.dkr.ecr.eu-central-1.amazonaws.com/mytestimage
sudo aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 199316303204.dkr.ecr.eu-central-1.amazonaws.com
sudo docker push 199316303204.dkr.ecr.eu-central-1.amazonaws.com/mytestimage
sudo docker stop $(sudo docker ps)
sudo docker rm $(sudo docker ps -a)
sudo docker run -d -p 80:80 199316303204.dkr.ecr.eu-central-1.amazonaws.com/mytestimage
