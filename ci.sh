pwd
rm -rf *
git clone https://github.com/krishnansai/docker-test.git
ls
cp -r docker-test/* .
ls
sudo docker images
sudo docker login
sudo docker build . -t krishnansai/docker-test
sudo docker push krishnansai/docker-test
