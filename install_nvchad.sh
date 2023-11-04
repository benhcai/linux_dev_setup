#!/bin/bash

curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${curr_dir}/printC.sh"

printC "NvChad setup and install...\n" $CYAN && \

printC "Installing font...\n" $BLUE && \
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


printC "Installing gcc...\n" $BLUE && \
sudo apt install gcc && \

printC "Installing make...\n" $BLUE && \
sudo apt install make && \

printC "Installing xclip (for clipboard)...\n" $BLUE && \
sudo apt install xclip && \

printC "Installing ripgrep (for telescope)...\n" $BLUE && \
sudo apt-get install ripgrep && \

printC "Removing old nvim files...\n" $BLUE && \
rm -rf ~/.config/nvim && \
rm -rf ~/.local/share/nvim && \

printC "Cloning NvChad repo\n" $BLUE && \
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

printC "Installed NvChad\n" $BLUE
