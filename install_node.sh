#!/bin/bash

source ./printC.sh

printC "Removing existing NVM and Node... \n" $CYAN && \
rm -Rf ~/.npm ~/.nvm && \
printC "Installing NVM... \n" $CYAN && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && \
sudo [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
sudo [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
printC "Installing node & npm... \n" $CYAN && \
nvm install node
