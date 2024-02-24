#!/bin/bash

source ./printC.sh

## Install NvChad

read -p "Install NvChad? (y/N): " res
if [[ $res = "y" ]]; then
  printC $CYAN "Installing NvChad... \n" && \
  source ./nvchad.sh
else
  echo $res;
  printC $CYAN "Skipping NvChad... \n"
fi

## Install and setup docker

read -p "Install docker? (y/N): " res
if [[ $res = "y" ]]; then
  printC $CYAN "Installing docker... \n" && \
  source ./docker.sh
else
  echo $res;
  printC $CYAN "Skipping docker... \n"
fi

# Install DBMS

read -p "Install PostGres? (y/N): " res
if [[ $res == "y" ]]; then
  printC $CYAN "Installing PostGres... \n" && \
  source ./postgresh.sh
else
  printC $CYAN "Skipping PostGres... \n"
fi

## Install MongoDb
read -p "Install MongoDb? (y/N): " res
if [[ $res == "y" ]]; then
  printC $CYAN "Installing MongoDb... \n" && \
  source ./mongod.sh
else
  printC $CYAN "Skipping MongoDb... \n"
fi

# Install Snap apps
read -p "Install Snap apps? (y/N): " res
if [[ $res != "y" ]]; then
  printC $CYAN "Installing notion... \n" && \
  sudo snap install notion-snap
  printC $CYAN "Installing zoom-client... \n" && \
  sudo snap install zoom-client && \
  printC $CYAN "Installing slack... \n" && \
  sudo snap install slack && \
  printC $CYAN "End of additional installs \n"
else
  exit 1
fi

