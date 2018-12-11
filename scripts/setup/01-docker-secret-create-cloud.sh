#!/usr/bin/env bash

export SECRET_PATH=/run/secrets
export PEM_PATH=$SECRET_PATH/certificates/usc

export SITE=cloud
export DOMAIN_NAME=$SITE.usc.edu
docker secret create cert-$DOMAIN_NAME.pem $PEM_PATH/$DOMAIN_NAME/haproxy/cert-$DOMAIN_NAME.pem

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
docker secret create dropboxchoice.usc.edu-my-groups-api.txt $SECRET_PATH/passwords/usc/middleware/dropbox/my-groups-api.txt

export SITE=workday-account-translator
export DOMAIN_NAME=$SITE.usc.edu
docker secret create cert-$DOMAIN_NAME.pem $PEM_PATH/$DOMAIN_NAME/haproxy/cert-$DOMAIN_NAME.pem
docker secret create $DOMAIN_NAME.key $PEM_PATH/$DOMAIN_NAME/$DOMAIN_NAME.key
docker secret create $DOMAIN_NAME-sp-key.pem $PEM_PATH/shibboleth/$DOMAIN_NAME/sp-key.pem
docker secret create $DOMAIN_NAME-sp-cert.pem $PEM_PATH/shibboleth/$DOMAIN_NAME/sp-cert.pem
docker secret create $DOMAIN_NAME-tt_secrets.txt $SECRET_PATH/passwords/usc/workday/tt_secrets.txt
docker secret create dfp_users_backend $SECRET_PATH/passwords/usc/workday/secrets/dfp_users_backend.txt

export SITE=device-registration
export DOMAIN_NAME=$SITE.usc.edu
docker secret create cert-$DOMAIN_NAME.pem $PEM_PATH/$DOMAIN_NAME/haproxy/cert-$DOMAIN_NAME.pem
