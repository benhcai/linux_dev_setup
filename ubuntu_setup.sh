#!/bin/bash
:'
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
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
chmod u+x nvim.appimage && \
./nvim.appimage --appimage-extract && \
./squashfs-root/AppRun --version && \
### Optional: exposing nvim globally.
sudo mv squashfs-root / && \
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim && \
printC "Cleaning up... \n" $CYAN && \
rm -rf FiraCode FiraCode.zip squashfs-root nvim.appimage && \
\
printC "Removing existing NVM and Node... \n" $CYAN && \
rm -Rf ~/.npm ~/.nvm && \
\
printC "Installing NVM... \n" $CYAN && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && \
sudo [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
sudo [ -s "$NVM_DIR/nvm.sh" ] && \. ~/.nvm/nvm.sh && \
\
printC "Installing node... \n" $CYAN && \
nvm install node  && \
\
printC "Installing yarn... \n" $CYAN && \
npm install --global yarn && \
\
printC "Installed yarn version: " $GREEN && \
yarn --version && \
\
printC "Installing tsc... \n" $CYAN && \
sudo apt install node-typescript && \
\
printC "Installing snapd... \n" $CYAN && \
sudo apt install snapd && \
\
printC "Installing vscode... \n" $CYAN && \
sudo snap install code --classic && \


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

printC "Setup complete. \n" $GREEN
