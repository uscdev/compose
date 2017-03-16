#!/bin/bash
# Param 1: dev = swarm

if [ ! -d "/run/secrets" ]; then
  ~/initsecrets.sh
fi

export USC_SECRETS_DIR=/run/secrets
export USC_MOBILE_DB_PASSWORD=default-password-QjX1a
export USC_WORDPRESS_DB_PASSWORD=default-password-QjX1ai
export USC_T2_DB_PASSWORD=default-password-QjX1ai
export USC_NEXUS_KEYSTORE_PASSWORD=default-password-QjX1ai
. ${USC_SECRETS_DIR}/scripts/setsecrets.sh $1

export USC_SHARED_DIR_NFS=/mnt/docker/nfs
export USC_SHARED_DIR=/mnt/docker/gluster
export USC_LOCAL_DIR=/mnt/docker/disk2

export USC_MOBILE_DATA_DIR=${USC_SHARED_DIR_NFS}/mobile/data
export USC_MOBILE_DB_DIR=${USC_SHARED_DIR_NFS}/mobile/db
export USC_MOBILE_SERVER_NAME=mobile.docker.usc.edu

export NODE00=${HOSTNAME}
export NODE01=${HOSTNAME}
export NODE02=${HOSTNAME}
export NODE03=${HOSTNAME}

mkdir -p ${USC_SHARED_DIR_NFS}/wordpress/db
mkdir -p ${USC_SHARED_DIR_NFS}/wordpress/data
mkdir -p ${USC_LOCAL_DIR}/jenkins
mkdir -p ${USC_LOCAL_DIR}/nexus
chmod a+rw ${USC_SHARED_DIR_NFS}/wordpress/db
chmod a+rw ${USC_SHARED_DIR_NFS}/wordpress/data
chmod a+rw ${USC_LOCAL_DIR}/jenkins
chmod a+rw ${USC_LOCAL_DIR}/nexus

unset DOCKER_HOST
unset DOCKER_TLS_VERIFY
unset DOCKER_CERT_PATH
if [ "$1" = "dev" ]; then
    export NODE00=dcorley-swarm-mgr01.usc.edu
    export NODE01=dcorley-swarm-node01.usc.edu
    export NODE02=dcorley-swarm-node02.usc.edu
    export NODE03=dcorley-swarm-node03.usc.edu

    export DOCKER_HOST=tcp://${NODE00}:2376
    export DOCKER_TLS_VERIFY=1
    export DOCKER_CERT_PATH=${USC_SECRETS_DIR}/keys/swarm-tls
fi;
