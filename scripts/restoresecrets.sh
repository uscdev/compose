#!/bin/bash
export USC_FILTER=$1
if [ "$USC_FILTER" = "" ]; then
  export USC_FILTER=$USER
fi
cd /run
sudo echo
sudo openssl des3 -d -in $HOME/workspace/secrets/$USC_FILTER.tar.gz.enc | sudo tar -C /run -xz
