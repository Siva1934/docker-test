#!/bin/bash

whoami
sudo apt update
sudo apt install git -y
rm -rf *
git clone https://github.com/krishnansai/docker-test.git
cp -r ./docker-test/* .
sudo apt install docker.io -y
sudo docker build . -t 199316303204.dkr.ecr.eu-central-1.amazonaws.com/myimage
aws ecr get-login-password --region eu-central-1 | sudo docker login --username AWS --password-stdin 199316303204.dkr.ecr.eu-central-1.amazonaws.com
sudo docker push 199316303204.dkr.ecr.eu-central-1.amazonaws.com/myimage
sudo docker pull 199316303204.dkr.ecr.eu-central-1.amazonaws.com/myimage
sudo docker stop $(sudo docker ps)
sudo docker rm $(sudo docker ps -a)
sudo docker run -d -p 80:80 199316303204.dkr.ecr.eu-central-1.amazonaws.com/myimage

