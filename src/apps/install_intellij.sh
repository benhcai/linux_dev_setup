#!/bin/bash

curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${curr_dir}/../printC.sh"

printC $CYAN "Installing Intellij IDEA...\n"

# Check snap is installed
VER=$(snap --version | head -n 1 | awk "{print $2}")
if [[ -z $VER ]]; then 
    printC $RED "Snap not installed. \n" 
    exit 1
else
    printC $TEAL "Snap version $VER installed... \n"
fi

sudo snap install intellij-idea-community --channel=2023.3/stable --classic

# rm -rf ideaIC.tar.gz

# URL="https://download.jetbrains.com/idea/ideaIC-2024.1.1.tar.gz?_gl=1*1l2fblk*_ga*MTQwNjUyODE4OC4xNzE1MTMwMzk4*_ga_9J976DJZ68*MTcxNTEzMDM5OC4xLjEuMTcxNTEzMDQzMC40NC4wLjA.&_ga=2.254131336.1030295548.1715130398-1406528188.1715130398"
# curl -Lo ideaIC.tar.gz $URL && \

# CONTENTS=$(tar -tf ideaIC*.tar.gz | while IFS= read -r line; do
#     echo "$line" | awk -F/ '{print $1}'
#     break  # Stop after the first line
# done) && \
# printC $PURPLE "Extracting ${CONTENTS}... \n"

# sudo tar -xzf ideaIC*.tar.gz && \
# sudo rm -rf /opt/$CONTENTS && \
# sudo mv ./$CONTENTS /opt && \
# sudo /opt/$CONTENTS/bin/idea.sh && \

# rm -rf ideaIC.tar.gz
