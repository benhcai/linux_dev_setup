#!/bin/bash

source ./printC.sh

## Install NvChad

printC $CYAN "Install NvChad? (y/N): "
read  res
if [[ $res = "y" ]]; then
  printC $CYAN "Installing NvChad... \n" && \
  source ./src/nvchad.sh
else
  echo $res;
  printC $CYAN "Skipping NvChad... \n"
fi

## Install and setup docker

printC $CYAN "Install docker? (y/N): "
read res
if [[ $res = "y" ]]; then
  printC $CYAN "Installing docker... \n" && \
  source ./src/docker.sh
else
  echo $res;
  printC $CYAN "Skipping docker... \n"
fi

# Install DBMS

printC $CYAN "Install PostGres? (y/N): "
read res
if [[ $res == "y" ]]; then
  printC $CYAN "Installing PostGres... \n" && \
  source ./src/postgresh.sh
else
  printC $CYAN "Skipping PostGres... \n"
fi

## Install MongoDb
printC $CYAN "Install MongoDb? (y/N): "
read res
if [[ $res == "y" ]]; then
  printC $CYAN "Installing MongoDb... \n" && \
  source ./src/mongod.sh
else
  printC $CYAN "Skipping MongoDb... \n"
fi

# Install Snap apps
printC $CYAN "Install Snap apps? (y/N): "
read res
if [[ $res == "y" ]]; then
  printC $CYAN "Installing notion... \n" && \
  sudo snap install notion-snap-reborn
  printC $CYAN "Installing zoom-client... \n" && \
  sudo snap install zoom-client && \
  printC $CYAN "Installing slack... \n" && \
  sudo snap install slack && \
  printC $CYAN "End of additional installs \n"
else
  exit 1
fi

