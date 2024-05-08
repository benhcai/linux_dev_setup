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
source ./apps/install_neovim.sh && \
# Install node, nvm, npm
source ./apps/node.sh && \
printC $CYAN "Installing yarn... \n" && \
source ./apps/install_yarn && \
printC $CYAN "Installing tsc... \n" && \
source ./apps/install_typescript && \
printC $CYAN "Installing pip... \n" && \
source./apps/python-pip.sh && \
printC $CYAN "Installing jupyter labs... \n" && \
source ./apps/install_jupyter_notebooks && \
printC $CYAN "Installing snapd... \n" && \
source ./apps/install_snap && \
printC $CYAN "Installing vscode... \n" && \
source ./apps/install_vscode && \


## Setup Git and Github CLI
source ./apps/git_gh.sh

printC $GREEN "Setup complete. \n"
