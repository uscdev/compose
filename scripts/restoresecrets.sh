#!/bin/bash
export USC_FILTER=$1
if [ "$USC_FILTER" = "" ]; then
  export USC_FILTER=$USER
fi
if [ "$SECRETS_FILE_PATH" = "" ]; then
  export SECRETS_FILE_PATH=$HOME/workspace/secrets
fi
cd /run
sudo echo
sudo openssl des3 -d -in $SECRETS_FILE_PATH/$USC_FILTER.tar.gz.enc | sudo tar -C /run -xz
