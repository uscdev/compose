#!/usr/bin/env bash

export SECRET_PATH=/run/secrets

docker volume create -d "cloudstor:aws" \
  --opt size=10 \
  --opt backing=relocatable \
  wd-mongo-data
#  --opt ebstype=io1 \
#  --opt iops=1000 \

# docker volume create -d "cloudstor:aws" --opt backing=shared jenkins-data
docker volume create -d "cloudstor:aws" \
  --opt size=30 \
  --opt backing=relocatable \
  jenkins-data

# docker volume create -d "cloudstor:aws" --opt backing=shared nexus-data
docker volume create -d "cloudstor:aws" \
  --opt size=30 \
  --opt backing=relocatable \
  nexus-data

docker volume create -d "cloudstor:aws" \
  --opt size=30 \
  --opt backing=relocatable \
  grafana-data

docker volume create -d "cloudstor:aws" \
  --opt size=30 \
  --opt backing=relocatable \
  alert-manager-data

# docker volume create -d "cloudstor:aws" --opt backing=shared nexus-data
docker volume create -d "cloudstor:aws" \
  --opt size=30 \
  --opt backing=relocatable \
  --opt uid=1000,gid=1000 \
  elasticsearch-data
docker stack deploy --compose-file ./shared/docker-compose-volume-fix-elk.yml elk-fix-volume

# docker volume create -d "cloudstor:aws" --opt backing=shared nexus-data
docker volume create -d "cloudstor:aws" \
  --opt size=30 \
  --opt backing=relocatable \
  filebeat-data

# devops example
docker volume create -d "cloudstor:aws" \
  --opt size=30 \
  --opt backing=relocatable \
  mongo-db

docker volume create -d "cloudstor:aws" \
  --opt size=1 \
  --opt backing=relocatable \
  portainer-data

docker volume create -d "cloudstor:aws" \
  --opt size=2 \
  --opt backing=relocatable \
  guacamole-db
docker stack deploy --compose-file ./shared/docker-compose-volume-fix-guacamole.yml guacamole-fix-volume
