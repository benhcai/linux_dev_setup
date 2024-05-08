#!/bin/bash

# Downlaod function and load into terminal without creating a file
source <(curl -s https://raw.githubusercontent.com/benhcai/linux_dev_setup/main/printC.sh)

# Update packages
printC $CYAN "Updating and installing apps... \n" && \
sudo apt update && \
sudo apt upgrade

# Get git
printC $CYAN "Installing git...\n"
sudo apt install git

# download repo
git clone https://github.com/benhcai/linux_dev_setup.git
cd linux_dev_setup/src

source ./install_dev_essentials.sh
