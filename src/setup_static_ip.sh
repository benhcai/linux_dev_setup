#!/bin/bash

CONFIG_FILE=$(ls /etc/netplan | head -n 1)

read -p "Network interface: " ni
read -p "Static ip: " ip
read -p "Subnet prefix length (24,16): " subnet
read -p "Gateway: " gateway

sudo tee -a /etc/netplan/$CONFIG_FILE > /dev/null <<EOI
      $ni:
        addresses:
          - $ip/$subnet
        routes:
          - to: default
            via: $gateway
        nameservers:
            addresses: [1.1.1.1, 8.8.8.8]
EOI

# sudo netplan set ethernets.$ni.addresses="[$ip/$subnet]"
# sudo netplan set ethernets.$ni.routes="[{to: default, via: $gateway}]"
# sudo netplan set ethernets.$ni.nameservers.addresses="[1.1.1.1, 8.8.8.8]"


sudo chmod 600 /etc/netplan/$CONFIG_FILE
sudo netplan apply
