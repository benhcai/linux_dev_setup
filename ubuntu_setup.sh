!#/bin/bash

# A post-install script for Ubuntu to install developer tools
# curl -LO https://raw.githubusercontent.com/code0312/linux_dev_setup/main/ubuntu_setup.sh

sudo apt update && \
sudo apt upgrade && \
sudo apt install git neovim snapd && \
sudo snap install code --classic && \
\
read "Enter Git name: " gitName && \
 git config --global user.name "$gitName" && \
read "Enter Git email: " gitEmail && \
 git config --global user.email "$gitEmail" && \
 echo "Git configured for $gitName, $gitEmail"