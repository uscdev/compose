#!/usr/bin/env bash

docker network create --driver overlay proxy
docker network create --driver overlay monitor
docker network create --driver overlay logging
docker network create --driver overlay test
docker network create --driver overlay selenium
docker network create --driver overlay docker-proxy
docker network create --driver overlay --attachable clair
