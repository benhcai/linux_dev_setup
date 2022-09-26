#!/bin/bash
'
A post-install script for Ubuntu to install developer tools
To download the file, run:
sudo apt update && \
sudo apt upgrade && \
sudo apt install curl && \
curl -LO https://raw.githubusercontent.com/code0312/linux_dev_setup/main/ubuntu_setup.sh && \
chmod +x ubuntu_setup.sh
'

# Constants
GREEN='\033[0;32m'
BLUE='\033[0;94m'
CYAN='\033[0;36m'
NC='\033[0m'

function printC {
    local STR=$1
    local COLOR=$2
    echo -ne $COLOR$STR$NC 
}

# Configs
## Turn off terminal bell
echo "set bell-style none" | sudo tee -a /etc/inputrc > /dev/null
## Turn off LESS (man) bell
export LESS="$LESS -Q"

## Main apps
printC "Updating and installing apps... \n" $CYAN && \
sudo apt update && \
sudo apt upgrade && \
printC "Installing git... \n" $CYAN && \
sudo apt install git
printC "Installing gh... \n" $CYAN && \
sudo apt install gh
printC "Installing neovim... \n" $CYAN && \
sudo apt install neovim && \
printC "Removing existing NVM and Node... \n" $CYAN && \
rm -Rf ~/.npm ~/.nvm && \
printC "Installing NVM... \n" $CYAN && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
printC "Installing node... \n" $CYAN && \
nvm install node  && \
\
printC "Installing yarn... \n" $CYAN && \
npm install --global yarn && \
printC "Installed yarn version: " $GREEN && \
yarn --version && \
\
printC "Installing tsc... \n" $CYAN && \
sudo apt install node-typescript && \
\
printC "Installing snapd... \n" $CYAN && \
sudo apt install snapd && \
printC "Installing vscode... \n" $CYAN && \
sudo snap install code --classic && \
printC "Installing notion... \n" $CYAN && \
sudo snap install notion-snap
printC "Installing zoom-client... \n" $CYAN && \
sudo snap install zoom-client && \
printC "Installing slack... \n" $CYAN && \
sudo snap install slack && \
\
## Setup Git
printC "Setting up Git... \n" $CYAN
printC "Enter Git name: " $BLUE
read gitName && \
git config --global user.name "$gitName" && \
printC "Enter Git email: " $BLUE
read gitEmail && \
git config --global user.email "$gitEmail" && \
printC "Git configured for $gitName, $gitEmail \n" $GREEN && \
\
## Setup gh
printC "Setting up gh auth... \n" $CYAN
gh auth login && \
\
## Install and setup docker
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
printC "Setup complete. \n" $GREEN
