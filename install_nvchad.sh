#!/bin/bash
#
source ./printC.sh

printC "Installing NvChad..." $CYAN && \

printC "Installing font..." $BLUE && \
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/FiraCode.zip && \
unzip -d FiraCode ./FiraCode.zip && \
mkdir -p ~/.local/share/fonts && \
cp ./FiraCode/FiraCodeNerdFont-Regular.ttf ~/.local/share/fonts && \
fc-cache -f && \
fc-list | grep FiraCode && \

printC "Installing ripgrep (for telescop)" $BLUE && \
sudo apt-get install ripgrep && \

printC "Removing old nvim files" $BLUE && \
rm -rf ~/.config/nvim && \
rm -rf ~/.local/share/nvim && \
printC "Cloning NvChad repo" $BLUE && \
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

printC "Cloning NvChad repo" $BLUE
