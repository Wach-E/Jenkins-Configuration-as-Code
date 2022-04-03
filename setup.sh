#!/bin/bash

# Setup docker
sudo apt update -y
sudo apt install docker.io -y 
sudo systemctl start docker 
sudo usermod -aG docker ubuntu
sudo systemctl enable docker
# Give the jenkins user permission on docker by changing its permission
sudo chmod 666 /var/run/docker.sock 
