#!/bin/bash

curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${curr_dir}/../printC.sh"

printC $CYAN "Installing neovim... \n" && \
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage && \
chmod u+x nvim.appimage && \
./nvim.appimage --appimage-extract && \
./squashfs-root/AppRun --version && \
### Optional: exposing nvim globally.
sudo mv squashfs-root / && \
sudo ln -s /squashfs-root/AppRun /usr/bin/nvim && \
printC $CYAN "Cleaning up... \n" && \
rm -rf FiraCode FiraCode.zip squashfs-root nvim.appimage