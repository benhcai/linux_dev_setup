#!/bin/bash

curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${curr_dir}/../printC.sh"

# Install node, nvm, npm
printC $CYAN "Removing existing NVM and Node... \n" && \
rm -Rf ~/.npm ~/.nvm && \
printC $CYAN "Installing NVM... \n" && \
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" && \
sudo [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
sudo [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
printC $CYAN "Installing node & npm... \n" && \
nvm install node
