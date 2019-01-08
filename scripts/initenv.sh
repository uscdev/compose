#!/bin/bash
# Param 1: dev = swarm

export USC_ENV=$1

if [ "$USC_ENV" != "dcorley-swarm.usc.edu" ] && [ "$USC_ENV" != "swarm-test.usc.edu" ] && [ "$USC_ENV" != "emailchoice.usc.edu" ] && [ "$USC_ENV" != "swarm.usc.edu" ] && [ "$USC_ENV" != "docker.usc.edu" ] && [ "$USC_ENV" != "cloud.usc.edu" ]  && [ "$USC_ENV" != "poc.usc.edu" ] && [ "$USC_ENV" != "aws" ]; then
  echo "Environment: [local], dcorley-swarm.usc.edu, swarm-test.usc.edu, emailchoice.usc.edu, swarm.usc.edu, docker.usc.edu, cloud.usc.edu, poc.usc.edu, aws: "
  read USC_ENV
  if [ "$USC_ENV" != "dcorley-swarm.usc.edu" ] && [ "$USC_ENV" != "swarm-test.usc.edu" ] && [ "$USC_ENV" != "emailchoice.usc.edu" ] && [ "$USC_ENV" != "swarm.usc.edu" ] && [ "$USC_ENV" != "docker.usc.edu" ] && [ "$USC_ENV" != "cloud.usc.edu" ] && [ "$USC_ENV" != "poc.usc.edu" ] && [ "$USC_ENV" != "aws" ]; then
    export USC_ENV=local
  fi
fi

if [ ! -d "/run/secrets" ]; then
  ~/restoresecrets.sh
fi

export USC_SECRETS_DIR=/run/secrets
export USC_DEFAULT_PASSWORD=do-not-use-JdYrCiCdWa
export USC_MOBILE_DB_PASSWORD=$USC_DEFAULT_PASSWORD
export USC_WORDPRESS_DB_PASSWORD=$USC_DEFAULT_PASSWORD
export USC_T2_DB_PASSWORD=$USC_DEFAULT_PASSWORD
export USC_NEXUS_KEYSTORE_PASSWORD=$USC_DEFAULT_PASSWORD
export USC_MOBILE_PORT=8084
export USC_MOBILE_ADMIN_PASSWORD=$USC_DEFAULT_PASSWORD
export USC_NEXUS_PASSWORD=$USC_DEFAULT_PASSWORD
export USC_APPLE_PASSWORD=$USC_DEFAULT_PASSWORD
if [ "$TZ" = "" ]; then
  export TZ=America/Los_Angeles
fi
. ${USC_SECRETS_DIR}/scripts/setsecrets.sh $USC_ENV

export USC_SHARED_DIR_NFS=/mnt/docker/nfs
export USC_SHARED_DIR=/mnt/docker/gluster
export USC_LOCAL_DIR=/mnt/docker/disk2
export USC_BLOCK_DIR=/mnt/docker/disk2
export USC_BACKUP_DIR=${USC_SHARED_DIR_NFS}

export USC_MOBILE_DATA_DIR=${USC_SHARED_DIR_NFS}/mobile/data
export USC_MOBILE_DB_DIR=${USC_SHARED_DIR_NFS}/mobile/db
export USC_MOBILE_DATA_DIR=mobile-data
export USC_MOBILE_DB_DIR=mobile-db

export USC_MOBILE_SERVER_NAME=mobile.docker.usc.edu

export NODE00=${HOSTNAME}
export NODE01=${HOSTNAME}
export NODE02=${HOSTNAME}
export NODE03=${HOSTNAME}

mkdir -p ${USC_SHARED_DIR_NFS}/wordpress/db
mkdir -p ${USC_SHARED_DIR_NFS}/wordpress/data
mkdir -p ${USC_BLOCK_DIR}/jenkins
mkdir -p ${USC_BLOCK_DIR}/nexus
chmod a+rw ${USC_SHARED_DIR_NFS}/wordpress/db
chmod a+rw ${USC_SHARED_DIR_NFS}/wordpress/data
chmod a+rw ${USC_BLOCK_DIR}/jenkins
chmod a+rw ${USC_BLOCK_DIR}/nexus

unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH

unset GRAFANA_DATA
unset ALERTMANAGER_DATA

if [ "$1" = "docker.usc.edu" ]; then
    export NODE00=dcorley-swarm-mgr01.usc.edu
    export NODE01=dcorley-swarm-node01.usc.edu
    export NODE02=dcorley-swarm-node02.usc.edu
    export NODE03=dcorley-swarm-node03.usc.edu

    export GRAFANA_DATA=grafana-data
    export ALERTMANAGER_DATA=alertmanager-data
    export NEXUS_DATA=nexus-data
fi;
if [ "$1" = "swarm-test.usc.edu" ]; then
    export NODE00=swarm-test1.usc.edu
    export NODE01=swarm-test1.usc.edu
    export NODE02=swarm-test2.usc.edu
    export NODE03=swarm-test3.usc.edu
fi;
if [ "$1" = "swarm.usc.edu" ]; then
    export NODE00=swarm.usc.edu
    export NODE01=swarm.usc.edu
    export NODE02=swarm.usc.edu
    export NODE03=swarm.usc.edu
fi;
if [ "$1" = "emailchoice.usc.edu" ]; then
    export NODE00=emailchoice-prod-node1.usc.edu
    export NODE01=emailchoice-prod-node1.usc.edu
    export NODE02=emailchoice-prod-node2.usc.edu
    export NODE03=emailchoice-prod-node3.usc.edu
fi;
if [ "$1" = "poc.usc.edu" ]; then
    export NODE00=nsxpoc-swarm-mgr01.usc.edu
    export NODE01=nsxpoc-swarm-mgr01.usc.edu
    export NODE02=nsxpoc-swarm-mgr02.usc.edu
    export NODE03=nsxpoc-swarm-mgr03.usc.edu
fi;

export DOCKER_HOST=tcp://${NODE00}:2376
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH=${USC_SECRETS_DIR}/certificates/docker/$USC_ENV/client-certs

if [ "$1" = "local" ]; then
    export USC_MOBILE_PORT=80
    unset DOCKER_HOST
    unset DOCKER_TLS_VERIFY
    unset DOCKER_CERT_PATH
fi;
if [ "$1" = "aws" ]; then
    export USC_MOBILE_PORT=80
    export DOCKER_HOST=:2374
    unset DOCKER_TLS_VERIFY
    unset DOCKER_CERT_PATH
fi;

