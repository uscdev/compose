#!/usr/bin/env bash
if [ "$1" = "aws" ] || [ "$1" = "" ] ; then
    if [ "$USC_MOBILE_PORT" = "" ]; then
        export USC_MOBILE_PORT=80
    fi
    if [ "$USC_MOBILE_DB_PASSWORD" = "" ]; then
        echo "Enter the database password:"
        read DB_PASSWORD
        export USC_MOBILE_DB_PASSWORD=$DB_PASSWORD
    fi;
    if [ "$ServerName" = "" ]; then
        export ServerName=mobile.usc.edu
    fi
    if [ "$USC_MOBILE_ADMIN_PASSWORD" = "" ]; then
        echo "Enter the Wordpress admin password:"
        read ADMIN_PASSWORD
        export USC_MOBILE_ADMIN_PASSWORD=$ADMIN_PASSWORD
    fi;
    if [ ! -e "docker-compose.yml" ]; then
        curl -O https://raw.githubusercontent.com/usc-its/compose/master/mobile/docker-compose.yml
        curl -O https://raw.githubusercontent.com/usc-its/compose/master/mobile/docker-compose-setup.yml
    fi
fi;

echo Remove old environment

docker swarm init
docker stack rm mobile
docker stack rm mobile-setup
sleep 5
docker network create --driver overlay mobile-db
docker network create --driver overlay web-bus
# sudo rm -fr ${USC_SHARED_DIR_NFS}/mobile/data/*
# sudo rm -fr ${USC_SHARED_DIR_NFS}/mobile/db/*
docker volume rm mobile-db
docker volume rm mobile-data

echo Create new environment

docker stack deploy --compose-file docker-compose.yml mobile
echo ...Please wait while the environment is created
sleep 120
echo Importing content
docker stack deploy --compose-file docker-compose-setup.yml mobile-setup
echo ...Please wait while content is created
sleep 100
echo Done. Set the site: https://classic-mobile-lb-1348677779.us-west-2.elb.amazonaws.com
echo Change route53 entry: https://mobile.usc.edu
