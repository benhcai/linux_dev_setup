#!/bin/bash

curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${curr_dir}/../printC.sh"

# Install git and Github CLI
printC $CYAN "Installing git... \n" && \
sudo apt install git && \
printC $CYAN "Installing gh... \n" && \
sudo apt install gh && \

## Setup Git
printC $CYAN "Setting up Git... \n"

printC $BLUE "Enter Git name: "
read gitName && \
git config --global user.name "$gitName"
printC $BLUE "Enter Git email: "
read gitEmail && \
git config --global user.email "$gitEmail"
printC $GREEN "Git configured for $gitName, $gitEmail \n"

## Setup Github CLI
printC $CYAN "Setting up gh auth... \n"
gh auth login

printC "Git and github CLI setup completed."
