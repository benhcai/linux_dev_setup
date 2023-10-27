#!/bin/bash

source ./printC.sh

## Install and setup docker

read -p "Install docker? (y/N): " res
if [[ $res = "y" ]]; then
  printC "Installing docker... \n" $CYAN && \
  source ./install_docker.sh 
else
  echo $res;
  printC "Skipping docker... \n" $CYAN
fi

# Install DBMS

read -p "Install PostGres? (y/N): " res
if [[ $res == "y" ]]; then
  printC "Installing PostGres... \n" $CYAN && \
  source ./install_postgres.sh
else
  printC "Skipping PostGres... \n" $CYAN
fi

## Install MongoDb
read -p "Install MongoDb? (y/N): " res
if [[ $res == "y" ]]; then
  printC "Installing MongoDb... \n" $CYAN && \
  source ./install_mongodb.sh
else
  printC "Skipping MongoDb... \n" $CYAN
fi

printC "End of additional installs \n" $CYAN
