#!/usr/bin/env bash

export SECRET_PATH=/run/secrets
export PEM_PATH=$SECRET_PATH/certificates/usc
export SELF_PATH=$SECRET_PATH/certificates/self

docker secret create apache.crt $SELF_PATH/apache.crt
docker secret create apache.key $SELF_PATH/apache.key
docker secret create sp-cert.pem $SELF_PATH/sp-cert.pem
docker secret create sp-key.pem $SELF_PATH/sp-key.pem

export SITE=swarm
export DOMAIN_NAME=$SITE.usc.edu
docker secret create cert-$DOMAIN_NAME.pem $PEM_PATH/$DOMAIN_NAME/haproxy/cert-$DOMAIN_NAME.pem
docker secret create $DOMAIN_NAME.key $PEM_PATH/$DOMAIN_NAME/csr/$DOMAIN_NAME.key
docker secret create $DOMAIN_NAME.cer $PEM_PATH/$DOMAIN_NAME/nginx/$DOMAIN_NAME.cer

export SITE=emailchoice
export DOMAIN_NAME=$SITE.usc.edu
docker secret create cert-$DOMAIN_NAME.pem $PEM_PATH/$DOMAIN_NAME/haproxy/cert-$DOMAIN_NAME.pem
docker secret create $DOMAIN_NAME.key $PEM_PATH/$DOMAIN_NAME/$DOMAIN_NAME.key
docker secret create $DOMAIN_NAME-sp-key.pem $PEM_PATH/shibboleth/$DOMAIN_NAME/sp-key.pem
docker secret create $DOMAIN_NAME-sp-cert.pem $PEM_PATH/shibboleth/$DOMAIN_NAME/sp-cert.pem
docker secret create $DOMAIN_NAME-my-groups-api.txt $SECRET_PATH/passwords/usc/middleware/emailchoice/my-groups-api.txt

export SITE=itapps
export DOMAIN_NAME=$SITE.usc.edu
docker secret create cert-$DOMAIN_NAME.pem $PEM_PATH/$DOMAIN_NAME/haproxy/cert-$DOMAIN_NAME.pem
docker secret create $DOMAIN_NAME.key $PEM_PATH/$DOMAIN_NAME/csr/$DOMAIN_NAME.key
docker secret create $DOMAIN_NAME-sp-key.pem $PEM_PATH/shibboleth/$DOMAIN_NAME/sp-key.pem
docker secret create $DOMAIN_NAME-sp-cert.pem $PEM_PATH/shibboleth/$DOMAIN_NAME/sp-cert.pem
docker secret create dropbox.usc.edu-my-groups-api.txt $SECRET_PATH/passwords/usc/middleware/dropbox/my-groups-api.txt

export SITE=workday-account-translator
export DOMAIN_NAME=$SITE.usc.edu
docker secret create cert-$DOMAIN_NAME.pem $PEM_PATH/$DOMAIN_NAME/haproxy/cert-$DOMAIN_NAME.pem
docker secret create $DOMAIN_NAME.key $PEM_PATH/$DOMAIN_NAME/$DOMAIN_NAME.key
docker secret create $DOMAIN_NAME-sp-key.pem $PEM_PATH/shibboleth/$DOMAIN_NAME/sp-key.pem
docker secret create $DOMAIN_NAME-sp-cert.pem $PEM_PATH/shibboleth/$DOMAIN_NAME/sp-cert.pem
docker secret create $DOMAIN_NAME-tt_secrets.txt $SECRET_PATH/passwords/usc/workday/tt_secrets.txt

export SITE=device-registration
export DOMAIN_NAME=$SITE.usc.edu
docker secret create cert-$DOMAIN_NAME.pem $PEM_PATH/$DOMAIN_NAME/haproxy/cert-$DOMAIN_NAME.pem

export SITE=jenkins
export DOMAIN_NAME=$SITE.usc.edu
docker secret create saml-key.jks $SECRET_PATH/certificates/usc/shibboleth/$SITE/saml-key.jks
docker secret create swarm-key-pair.pem $SECRET_PATH/keys/aws/ssh/usc/its-bsa-dev-1-us-west-2.pem
docker secret create its-bsa-dev-us-west-2-key-pair.pem $SECRET_PATH/keys/aws/ssh/usc/its-bsa-dev-1-us-west-2.pem
