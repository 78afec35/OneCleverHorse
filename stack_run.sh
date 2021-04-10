#!/bin/bash
scp -tt -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no docker-compose.yaml jenkins@swarm-manager:/home/jenkins/docker-compose.yaml 
ssh -tt -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no jenkins@swarm-manager << EOF
    export DATABASE_URI=${DATABASE_URI}
    export SECRET_KEY=${SECRET_KEY}
    docker image prune -f -a
    docker rmi -f -a
    docker rm $(docker ps -a -f -q)
    docker ps
    docker stack deploy --compose-file /home/jenkins/docker-compose.yaml onecleverhorsestack
EOF
