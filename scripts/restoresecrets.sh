#!/bin/bash

sudo echo
sudo openssl des3 -d -in $HOME/secrets.tar.gz.enc | sudo tar -C /run -xz
