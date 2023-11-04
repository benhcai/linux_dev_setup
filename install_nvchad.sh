#!/bin/bash
#
source ./printC.sh

printC "Installing NvChad...\n" $CYAN && \

printC "Installing font...\n" $BLUE && \
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip && \
unzip -d FiraCode ./FiraCode.zip && \
mkdir -p ~/.local/share/fonts && \
cp ./FiraCode/FiraCodeNerdFont-Regular.ttf ~/.local/share/fonts && \
fc-cache -f && \
fc-list | grep FiraCode && \

printC "Installing gcc...\n" $BLUE && \
sudo apt install gcc && \

printC "Installing make...\n" $BLUE && \
sudo apt install make && \

printC "Installing ripgrep (for telescope)...\n" $BLUE && \
sudo apt-get install ripgrep && \

printC "Removing old nvim files...\n" $BLUE && \
rm -rf ~/.config/nvim && \
rm -rf ~/.local/share/nvim && \
printC "Cloning NvChad repo\n" $BLUE && \
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

printC "Installed NvChad\n" $BLUE
