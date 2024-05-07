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
printC $CYAN "Installing curl... \n" && \
sudo apt install curl

printC $CYAN "Installing git... \n" && \
sudo apt install git && \
printC $CYAN "Installing neovim... \n" && \
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
chmod u+x nvim.appimage && \
./nvim.appimage --appimage-extract && \
./squashfs-root/AppRun --version && \
### Optional: exposing nvim globally.
sudo mv squashfs-root / && \
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim && \
printC $CYAN "Cleaning up... \n" && \
rm -rf FiraCode FiraCode.zip squashfs-root nvim.appimage
# Install node, nvm, npm
source ./node.sh && \
printC $CYAN "Installing yarn... \n" && \
npm install --global yarn && \
printC $GREEN "Installed yarn version: " && \
yarn --version && \
printC $CYAN "Installing tsc... \n" && \
sudo apt install node-typescript && \
printC $CYAN "Installing pip... \n" && \
source./python-pip.sh && \
printC $CYAN "Installing jupyter labs... \n" && \
pip install jupyterlab && \
printC $CYAN "Installing snapd... \n" && \
sudo apt install snapd && \
printC $CYAN "Installing vscode... \n" && \
sudo snap install code --classic && \


## Setup Git and Github CLI
source ./git_gh.sh

printC $GREEN "Setup complete. \n"
