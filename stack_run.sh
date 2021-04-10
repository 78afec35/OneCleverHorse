#!/bin/bash
ssh -tt -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no jenkins@swarm-manager << EOF
    sudo rm -rf /home/jenkins/docker-compose.yaml
EOF
scp -tt -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no docker-compose.yaml jenkins@swarm-manager:/home/jenkins/docker-compose.yaml 
ssh -tt -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no jenkins@swarm-manager << EOF
    export DATABASE_URI=${DATABASE_URI}
    export SECRET_KEY=${SECRET_KEY}
    docker image prune -f -a
    docker rmi -f -a
    docker rm -f -a
    docker ps
    docker stack deploy --compose-file /home/jenkins/docker-compose.yaml onecleverhorsestack
EOF
