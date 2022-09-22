#!/bin/bash

# A post-install script for Ubuntu to install developer tools
# To download the file, run:
# curl -LO https://raw.githubusercontent.com/code0312/linux_dev_setup/main/ubuntu_setup.sh

# Configs
## Turn off terminal bell
echo "set bell-style none" | sudo tee -a /etc/inputrc
## Turn off LESS (man) bell
export LESS="$LESS -Q"

## Main apps
sudo apt update && \
sudo apt upgrade && \
sudo apt install git neovim snapd && \
sudo snap install code --classic && \
\
## Setup Git
read "Enter Git name: " gitName && \
git config --global user.name "$gitName" && \
read "Enter Git email: " gitEmail && \
git config --global user.email "$gitEmail" && \
echo "Git configured for $gitName, $gitEmail" \
\
## Install and setup docker
sudo apt-get remove docker docker-engine docker.io containerd runc ; \
sudo apt-get update && \
sudo apt-get install ca-certificates curl gnupg lsb-release && \
sudo mkdir -p /etc/apt/keyrings && \
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt-get update && \
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin && \
sudo service docker start && \
sudo groupadd docker && \
sudo usermod -aG docker $USER && \
newgrp docker && \
sudo systemctl enable docker.service && \
sudo systemctl enable containerd.service && \
sudo echo {"log-driver": "json-file", "log-opts": {"max-size": "10m", "max-file": "3"}} >> /etc/docker/daemon.json && \
## Configuring remote access with systemd unit file
## Manual systemd edit docker.service
mkdir /etc/systemd/system/docker.service.d/
touch /etc/systemd/system/docker.service.d/override.conf
# cat << EOF "[Service]\nExecStart=\nExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375" | sudo tee -a /etc/inputrc"
cat << EOF >> /etc/systemd/system/docker.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375
EOF && \
sudo systemctl daemon-reload && \
sudo systemctl restart docker.service && \
sudo apt install net-tools && \
sudo netstat -lntp | grep dockerd

