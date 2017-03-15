cd /run
rm $HOME/secrets.tar.gz.enc
sudo echo
sudo tar cz secrets | openssl enc -aes-256-cbc -out $HOME/secrets.tar.gz.enc
