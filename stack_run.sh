#!/bin/bash
scp -tt -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no docker-compose.yaml jenkins@swarm-manager:/home/jenkins/docker-compose.yaml 
ssh -tt -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no jenkins@swarm-manager << EOF
    export DATABASE_URI=${DATABASE_URI}
    export SECRET_KEY=${SECRET_KEY}
    docker stack deploy --compose-file /home/jenkins/docker-compose.yaml OneCleverHorse-stack
EOF
