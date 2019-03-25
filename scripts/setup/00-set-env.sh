#!/usr/bin/env bash

# set -f;export BACKUP_CRON="0 4 * * *";set +f
# set -f;export BACKUP_CRON="*/10 * * * *";set +f

export SECRET_PATH=/run/secrets
export PEM_PATH=$SECRET_PATH/certificates/usc

export SITE=$2
if [ "$SITE" = "" ]; then
    export SITE=swarm
fi

export DOMAIN_NAME=$SITE.usc.edu

export HOME_PATH=$1
if [ "$HOME_PATH" = "" ]; then
    export HOME_PATH=$HOME
fi

export CODE_PATH=$HOME_PATH/workspace
export GITHUB_PATH=$CODE_PATH/github
export USC_PATH=$CODE_PATH/usc
export USC_DEV_PATH=$GITHUB_PATH/uscdev
export COMPOSE_PATH=$USC_DEV_PATH/compose
export DEVOPS_PATH=$USC_DEV_PATH/devops-example
export DEMO_DATA_PATH=$USC_DEV_PATH/demo-data

export PROMETHEUS_TAG=2-18.05.31-4
export ALERT_MANAGER_TAG=v0.15.3
export UNSEE_TAG=v0.8.0
export GRAFANA_TAG=5.0.1
export CADVISOR_TAG=v0.32.0
export NODE_EXPORTER_TAG=v0.15.2

export ELK_TAG=6.5.0
export LOGSPOUT_TAG=v3.2.2
export ELASTIC_TAG=$ELK_TAG
export ELASTIC_VERSION=$ELK_TAG

export GUACAMOLE_TAG=1.0.0
export GUACD_TAG=1.0.0
export GUACAMOLE_MYSQL_TAG=latest
