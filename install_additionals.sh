#!/bin/bash

source ./printC.sh

## Install NvChad

read -p "Install NvChad? (y/N): " res
if [[ $res = "y" ]]; then
  printC "Installing NvChad... \n" $CYAN && \
  source ./nvchad.sh
else
  echo $res;
  printC "Skipping NvChad... \n" $CYAN
fi

## Install and setup docker

read -p "Install docker? (y/N): " res
if [[ $res = "y" ]]; then
  printC "Installing docker... \n" $CYAN && \
  source ./docker.sh
else
  echo $res;
  printC "Skipping docker... \n" $CYAN
fi

# Install DBMS

read -p "Install PostGres? (y/N): " res
if [[ $res == "y" ]]; then
  printC "Installing PostGres... \n" $CYAN && \
  source ./postgresh.sh
else
  printC "Skipping PostGres... \n" $CYAN
fi

## Install MongoDb
read -p "Install MongoDb? (y/N): " res
if [[ $res == "y" ]]; then
  printC "Installing MongoDb... \n" $CYAN && \
  source ./mongod.sh
else
  printC "Skipping MongoDb... \n" $CYAN
fi

# Install Snap apps
read -p "Install Snap apps? (y/N): " res
if [[ $res != "y"]]; then
  printC "Installing notion... \n" $CYAN && \
  sudo snap install notion-snap
  printC "Installing zoom-client... \n" $CYAN && \
  sudo snap install zoom-client && \
  printC "Installing slack... \n" $CYAN && \
  sudo snap install slack && \
  printC "End of additional installs \n" $CYAN
else
  exit 1
fi

