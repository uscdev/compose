#!/usr/bin/env bash
if [ "$1" = "aws" ]; then
    export USC_MOBILE_PORT=80
    if [ "$USC_MOBILE_DB_PASSWORD" = "" ]; then
        echo "Enter the database password:"
        read DB_PASSWORD
        export USC_MOBILE_DB_PASSWORD=$DB_PASSWORD
    fi;
    export ServerName=mobile.usc.edu
    if [ "$USC_MOBILE_DB_PASSWORD" = "" ]; then
        echo "Enter the Wordpress admin password:"
        read ADMIN_PASSWORD
        export USC_MOBILE_ADMIN_PASSWORD=$ADMIN_PASSWORD
    fi;
    if [ ! -d "setup" ]; then
        mkdir setup
        curl -O https://raw.githubusercontent.com/usc-its/compose/master/mobile/docker-compose.yml
        cd setup
        curl -O https://raw.githubusercontent.com/usc-its/compose/master/mobile/setup/docker-compose-setup.yml
        cd ..
    fi
fi;
echo done
sleep 10
docker stack rm mobile
docker stack rm mobile-setup 
# sudo rm -fr ${USC_SHARED_DIR_NFS}/mobile/data/*
# sudo rm -fr ${USC_SHARED_DIR_NFS}/mobile/db/*
docker volume rm mobile-db
docker volume rm mobile-data
docker stack deploy --compose-file docker-compose.yml mobile
cd setup/
sleep 10
docker stack deploy --compose-file docker-compose-setup.yml mobile-setup
 
