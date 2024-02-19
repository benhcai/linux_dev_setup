#!/bin/bash
:'
A post-install script for Ubuntu to install developer tools
To download the file, run:
wget https://raw.githubusercontent.com/benhcai/linux_dev_setup/main/install_dev_essentials.sh && \
chmod +x ubuntu_setup.sh
'

# Exit if any command fails
set -e

# Import colour echo
source printC.sh

# Configs
## Turn off terminal bell
echo "set bell-style none" | sudo tee -a /etc/inputrc > /dev/null
## Turn off LESS (man) bell
export LESS="$LESS -Q"

## Main apps
printC "Installing curl... \n" $CYAN && \
sudo apt install curl

printC "Installing git... \n" $CYAN && \
sudo apt install git && \
printC "Installing neovim... \n" $CYAN && \
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
chmod u+x nvim.appimage && \
./nvim.appimage --appimage-extract && \
./squashfs-root/AppRun --version && \
### Optional: exposing nvim globally.
sudo mv squashfs-root / && \
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim && \
printC "Cleaning up... \n" $CYAN && \
rm -rf FiraCode FiraCode.zip squashfs-root nvim.appimage
# Install node, nvm, npm
source ./node.sh && \
printC "Installing yarn... \n" $CYAN && \
npm install --global yarn && \
printC "Installed yarn version: " $GREEN && \
yarn --version && \
printC "Installing tsc... \n" $CYAN && \
sudo apt install node-typescript && \
printC "Installing snapd... \n" $CYAN && \
sudo apt install snapd && \
printC "Installing vscode... \n" $CYAN && \
sudo snap install code --classic && \


## Setup Git and Github CLI
source ./git_gh.sh

printC "Setup complete. \n" $GREEN
