export USC_FILTER=$1
if [ "$USC_FILTER" = "" ]; then
  export USC_FILTER=secrets
fi
cd /run
mkdir -p $HOME/secrets
rm $HOME/secrets/$USC_FILTER.tar.gz.enc
sudo echo
sudo tar cz $(cat ./secrets/scripts/filter/$USC_FILTER) | openssl des3 -out $HOME/secrets/$USC_FILTER.tar.gz.enc
