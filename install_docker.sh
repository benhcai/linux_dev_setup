#!/bin/bash

source ./printC.sh

printC "Removing old Docker files... \n" $CYAN && \
sudo apt-get remove docker docker-engine docker.io containerd runc ; \

printC "Installing Docker Engine, containerd and Compose... \n" $CYAN && \

printC "Installing using the repository and verifying... \n" $BLUE && \
sudo apt-get update && \
sudo apt-get install ca-certificates curl gnupg lsb-release && \
sudo mkdir -p /etc/apt/keyrings && \
sudo rm -f /etc/apt/keyrings/docker.gpg && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \

printC "Installing docker files... \n" $BLUE && \
sudo apt-get update && \
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && \
sudo service docker start && \
sudo groupadd docker && \
sudo usermod -aG docker $USER && \
newgrp docker ; \
sudo systemctl enable docker.service && \
sudo systemctl enable containerd.service && \

printC "Docker and Containerd enabled. \n" $GREEN && \

printC "Configuring log rotation... \n" $BLUE && \
(cat << EOF | sudo tee /etc/docker/daemon.json
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3" 
  }
}
EOF
) > /dev/null && \
## Manual systemd edit docker.service

printC "Configuring remote access with systemd unit file... \n" $BLUE && \
sudo mkdir -p /etc/systemd/system/docker.service.d/ && \
sudo touch /etc/systemd/system/docker.service.d/override.conf && \
(cat << EOF | sudo tee /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375
EOF
) > /dev/null && \
sudo systemctl daemon-reload && \
sudo systemctl restart docker.service

printC "Installing net-tools... \n" $CYAN && \
sudo apt install net-tools && \

printC "Dockerd netstat status: \n" $BLUE && \
sudo netstat -lntp | grep dockerd

wait
