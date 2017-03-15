#!/bin/bash

sudo echo
sudo openssl enc -aes-256-cbc -d -in $HOME/secrets.tar.gz.enc | sudo tar -C /run -xz
