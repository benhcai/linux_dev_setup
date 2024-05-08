#!/bin/bash

curr_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
source "${curr_dir}/../printC.sh"

printC $CYAN "Installing MongoDb... \n" && \
cat /etc/lsb-release && \
sudo apt-get install gnupg curl && \

curl -fsSL https://pgp.mongodb.com/server-7.0.asc | \
   sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
   --dearmor && \

echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list && \

sudo apt-get update && \

sudo apt-get install -y mongodb-org && \

ps --no-headers -o comm 1 && \

sudo systemctl daemon-reload && \

sudo systemctl start mongod && \

# Grep with color the status of mongod
sudo systemctl status mongod | grep "mongod.service" -A 5 | GREP_COLORS='ms=32' grep --color=always 'active' -A 5 -B 5

wait
