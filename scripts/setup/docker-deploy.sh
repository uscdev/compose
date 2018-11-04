#!/usr/bin/env bash

export SECRET_PATH=/run/secrets
export PEM_PATH=$SECRET_PATH/certificates/usc

export SITE=swarm
export DOMAIN_NAME=$SITE.usc.edu

export CODE_PATH=$HOME/workspace
export GITHUB_PATH=$CODE_PATH/github
export USC_PATH=$CODE_PATH/usc
export USC_DEV_PATH=$GITHUB_PATH/uscdev
export COMPOSE_PATH=$USC_DEV_PATH/compose

docker stack deploy --compose-file $COMPOSE_PATH/proxy/docker-compose.yml proxy

docker stack deploy --compose-file $COMPOSE_PATH/visualizer/docker-compose.yml visualizer
docker stack deploy --compose-file $COMPOSE_PATH/portainer/docker-compose.yml portainer

docker stack deploy --compose-file $COMPOSE_PATH/monitor/docker-compose.yml monitor

docker stack deploy --compose-file $COMPOSE_PATH/logging/docker-compose.yml logging

docker stack deploy --compose-file $COMPOSE_PATH/selenium/docker-compose.yml selenium
docker stack deploy --compose-file $COMPOSE_PATH/guacamole/docker-compose.yml guacamole

docker stack deploy --compose-file $COMPOSE_PATH/wordpress/docker-compose.yml wordpress
docker stack deploy --compose-file $COMPOSE_PATH/windows/docker-compose.yml windows
docker stack deploy --compose-file $COMPOSE_PATH/hello-dual/docker-compose.yml hello-dual
