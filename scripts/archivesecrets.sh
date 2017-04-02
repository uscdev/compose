cd /run
rm $HOME/secrets.tar.gz.enc
sudo echo
sudo tar cz secrets | openssl des3 -out $HOME/secrets.tar.gz.enc
