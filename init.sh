#!/bin/bash
: '
A post-install script for Ubuntu to install developer tools
To download the file, run:

Download and run this file to initiate installer for
Linux Dev Essentials and Optional Apps.
mkdir linux_dev_setup && cd linux_dev_setup
wget https://raw.githubusercontent.com/benhcai/linux_dev_setup/main/init.sh && \
chmod +x init.sh
'

# Downlaod function and load into terminal without creating a file
sudo apt install curl
source <(curl -s https://raw.githubusercontent.com/benhcai/linux_dev_setup/main/src/printC.sh)

# Update packages
printC $CYAN "Updating and installing apps... \n" && \
sudo apt update && \
sudo apt upgrade && \

# Get git
printC $CYAN "Installing git...\n"
sudo apt install git && \

# download repo
git init .
git remote add origin https://github.com/benhcai/linux_dev_setup.git
git checkout -b main
git pull origin main
cd src
ls -la

printC $CYAN "Install Dev Essentials? (y/N): "
read res
if [[ $res = "y" ]]; then
  printC $CYAN "Installing Dev Essentials... \n" && \
source ./install_dev_essentials.sh
else
  echo $res;
  printC $BROWN "Skipping Dev Essentials... \n"
fi

printC $CYAN "Install Optional Apps? (y/N): "
read res
if [[ $res = "y" ]]; then
  printC $CYAN "Installing Optional Apps... \n" && \
  source ./install_optionals.sh
else
  echo $res;
  printC $BROWN "Skipping Optional Apps... \n"
fi
