!#/bin/bash

# A post-install script for Ubuntu to install developer tools
# curl -LO https://raw.githubusercontent.com/code0312/linux_dev_setup/main/ubuntu_setup.sh

sudo apt update && \
sudo apt upgrade
sudo apt install neovim snapd && \
sudo snap install code --classic
