#!/bin/bash

curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${curr_dir}/printC.sh"

printC $CYAN "NvChad setup and install...\n" && \

printC $BLUE "Installing font...\n" && \
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip && \
#### Install FiraCode
unzip -d FiraCode ./FiraCode.zip && \
mkdir -p ~/.local/share/fonts && \
cp ./FiraCode/FiraCodeNerdFont-Regular.ttf ~/.local/share/fonts && \
fc-cache -f && \
fc-list | grep FiraCode && \
#### Set FiraCode as terminal font
PROFILE=$(gsettings get org.gnome.Terminal.ProfilesList default)
PROFILE=${PROFILE:1:-1}
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$PROFILE/" font 'FiraCode Nerd Font 12'


printC $BLUE "Installing gcc...\n" && \
sudo apt install gcc && \

printC $BLUE "Installing make...\n" && \
sudo apt install make && \

printC $BLUE "Installing xclip (for clipboard)...\n" && \
sudo apt install xclip && \

printC $BLUE "Installing ripgrep (for telescope)...\n" && \
sudo apt-get install ripgrep && \

printC $BLUE "Removing old nvim files...\n" && \
rm -rf ~/.config/nvim && \
rm -rf ~/.local/share/nvim && \

printC $BLUE "Cloning NvChad repo\n" && \
# git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

printC $CYAN "Cleaning up... \n" && \
rm -rf FiraCode FiraCode.zip squashfs-root nvim.appimage

printC $GREEN "Installed NvChad\n"

# Run initial setup in new bash (ensure npm and pip running), skip if not found. Try opening a new terminal.
#if [ -n "$(npm -v)" ] && [ -n "$(pip3 -V)" ]; then
#  	printC $GREEN "Dependencies OK...\n"
#	exec bash -c 'nvim'
#fi
#if [ -z "$(npm -v)" ]; then
#	printC $RED "NPM not found. Try opening in a new terminal. \n"
#fi 
#if [ -z "$(pip3 -V)" ]; then
#	printC $RED "pip not found. Try opening in a new terminal.\n"
#fi 
