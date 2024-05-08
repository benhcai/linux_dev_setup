#!/bin/bash

curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${curr_dir}/../printC.sh"

printC $CYAN "Installing yarn... \n" && \
npm install --global yarn && \
printC $GREEN "Installed yarn version: " && \
yarn --version