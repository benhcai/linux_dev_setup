#!/bin/bash

source ./printC.sh

## Install NvChad

printC $CYAN "Install NvChad? (y/N): "
read  res
if [[ $res = "y" ]]; then
  source ./apps/install_nvchad.sh
else
  echo $res;
  printC $BROWN "Skipping NvChad... \n"
fi

printC $CYAN "Install Java JDK? (y/N): "
read  res
if [[ $res = "y" ]]; then
  source ./apps/install_java_jdk.sh
else
  echo $res;
  printC $BROWN "Skipping Java... \n"
fi

## Install and setup docker

printC $CYAN "Install docker? (y/N): "
read res
if [[ $res = "y" ]]; then
  source ./apps/install_docker.sh
else
  echo $res;
  printC $BROWN "Skipping docker... \n"
fi

# Install DBMS

printC $CYAN "Install PostGres? (y/N): "
read res
if [[ $res == "y" ]]; then
  source ./apps/install_postgress.sh
else
  printC $BROWN "Skipping PostGres... \n"
fi

## Install MongoDb
printC $CYAN "Install MongoDb? (y/N): "
read res
if [[ $res == "y" ]]; then
  source ./apps/install_mongo.sh
else
  printC $BROWN "Skipping MongoDb... \n"
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
  printC $GREEN "Finished installing snap apps. \n"
else
  exit 1
fi

