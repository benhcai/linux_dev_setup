#!/bin/bash

curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${curr_dir}/../printC.sh"

printC $CYAN "Installing Java... \n" && \

URL="https://download.oracle.com/java/22/latest/jdk-22_linux-x64_bin.deb"
curl -Lo jdk.deb $URL
sudo apt install ./jdk.deb
rm -rf ./jdk.deb
printC $GREEN "Installed JDK Java version: \n" && \
java -version