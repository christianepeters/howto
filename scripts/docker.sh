#!/bin/bash
# install Docker
sudo apt update
sudo apt install docker.io
# start the Docker engine
sudo systemctl start docker
# first run Docker as sudo
sudo docker run hello-world
# prepare to run Docker as normal user
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
# now without sudo
docker run hello-world
