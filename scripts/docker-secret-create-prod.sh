#!/usr/bin/env bash

export SECRET_PATH=/run/secrets
export PEM_PATH=$SECRET_PATH/certificates/usc

export SITE=cloud
docker secret create cert-$SITE.usc.edu.pem $PEM_PATH/$SITE.usc.edu/haproxy/cert-$SITE.usc.edu.pem
export SITE=emailchoice
docker secret create cert-$SITE.usc.edu.pem $PEM_PATH/$SITE.usc.edu/haproxy/cert-$SITE.usc.edu.pem
export SITE=workday-account-translator
docker secret create cert-$SITE.usc.edu.pem $PEM_PATH/$SITE.usc.edu/haproxy/cert-$SITE.usc.edu.pem
export SITE=itapps
docker secret create cert-$SITE.usc.edu.pem $PEM_PATH/$SITE.usc.edu/haproxy/cert-$SITE.usc.edu.pem
export SITE=device-registration
docker secret create cert-$SITE.usc.edu.pem $PEM_PATH/$SITE.usc.edu/haproxy/cert-$SITE.usc.edu.pem

docker network create --driver overlay proxy