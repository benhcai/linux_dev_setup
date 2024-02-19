#!/bin/bash

source printC.sh

# Install git and Github CLI
printC "Installing git... \n" $CYAN && \
sudo apt install git && \
printC "Installing gh... \n" $CYAN && \
sudo apt install gh && \

## Setup Git
printC "Setting up Git... \n" $CYAN

printC "Enter Git name: " $BLUE
read gitName && \
git config --global user.name "$gitName"
printC "Enter Git email: " $BLUE
read gitEmail && \
git config --global user.email "$gitEmail"
printC "Git configured for $gitName, $gitEmail \n" $GREEN

## Setup Github CLI
printC "Setting up gh auth... \n" $CYAN
gh auth login

printC "Git and github CLI setup completed."
