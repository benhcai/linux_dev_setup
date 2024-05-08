#!/bin/bash

# Exit if an command fails
set -e

# Import colour echo
source printC.sh

# Configs
source ./change_configs.sh

## Main apps
source ./apps/install_curl.sh && \
source ./apps/install_git.sh && \
source ./apps/install_neovim.sh && \
source ./apps/install_node.sh && \
source ./apps/install_yarn && \
source ./apps/install_typescript && \
source ./apps/install_python-pip.sh && \
source ./apps/install_jupyter_labs && \
source ./apps/install_snap && \
source ./apps/install_vscode && \

## Setup Git and Github CLI
source ./apps/setup_git_gh.sh

printC $GREEN "Setup complete. \n"
