#!/bin/bash
ssh -tt -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no jenkins@swarm-manager << EOF
    export DATABASE_URI=${DATABASE_URI}
    export SECRET_KEY=${SECRET_KEY}
    rm -rf OneCleverHorse
    git clone https://github.com/78afec35/OneCleverHorse
    cd OneCleverHorse
    docker image prune -f -a
    docker rmi -f -a
    docker rm -f -a
    docker ps
    docker stack deploy --compose-file /home/jenkins/docker-compose.yaml onecleverhorsestack
EOF
