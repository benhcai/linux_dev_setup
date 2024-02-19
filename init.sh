#!/bin/bash

# Downlaod function and load into terminal without creating a file
source <(curl -s https://raw.githubusercontent.com/benhcai/linux_dev_setup/main/printC.sh)


# Get git
printC "Installing git...\n" $CYAN
sudo apt install git

# download repo
git clone https://github.com/benhcai/linux_dev_setup.git
cd linux_dev_setup
