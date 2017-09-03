#!/usr/bin/env bash
set -u
DIR=${PWD##*/}
DIRUL=${DIR//./_}
echo $DIR $DIRUL
rm -fr haproxy
mkdir -p haproxy
rm -f newline.txt
printf "\n" > newline.txt
sudo cat csr/${DIR}.key cert/${DIRUL}_cert.cer newline.txt cert/${DIRUL}_interm\ \(1\).cer > haproxy/cert-${DIR}.pem
rm -fr nginx
mkdir -p nginx
sudo cp csr/${DIR}.key nginx/
sudo cp cert/${DIRUL}.cer nginx/${DIR}.cer
rm -fr java
mkdir -p java
# sudo cat cert/${DIRUL}.cer cert/${DIRUL}_interm.cer > java/${DIR}.cer
openssl pkcs12 -inkey csr/${DIR}.key -in cert/${DIRUL}.cer -export -out java/${DIR}.pkcs12
sudo keytool -importkeystore -srckeystore java/${DIR}.pkcs12 -srcstoretype PKCS12 -destkeystore java/keystore.jks
keytool -list --keystore java/keystore.jks
