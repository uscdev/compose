#!/usr/bin/env bash

docker stack deploy --compose-file $DEMO_DATA_PATH/docker-compose.yml demo-data

sleep 15

docker stack deploy --compose-file $COMPOSE_PATH/backup/restore/docker-compose.yml restore
