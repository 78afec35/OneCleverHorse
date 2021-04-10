#!/bin/bash
export app_version=$BUILD_NUMBER
ssh swarm-manager
set app_version=$BUILD_NUMBER
rm -rf OneCleverHorse/
git clone https://github.com/78afec35/OneCleverHorse && cd OneCleverHorse
pwd
docker image prune -f -a
docker-compose pull
docker-compose build
docker stack deploy -c docker-compose.yaml OneCleverHorse