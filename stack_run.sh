#!/bin/bash
ssh swarm-manager
rm -rf OneCleverHorse/
git clone https://github.com/78afec35/OneCleverHorse && cd OneCleverHorse
docker image prune -f -a
docker-compose pull
docker stack deploy -c docker-compose.yaml OneCleverHorse