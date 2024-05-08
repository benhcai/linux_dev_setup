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

printC $CYAN "Installing Dev Essentials... "
source ./install_dev_essentials.sh && \
printC $CYAN "Install Optional Apps? (y/N): "
read  res
if [[ $res = "y" ]]; then
  printC $CYAN "Installing Optional Apps... \n" && \
  source ./install_optionals.sh
else
  echo $res;
  printC $BROWN "Skipping Optional Apps... \n"
fi
