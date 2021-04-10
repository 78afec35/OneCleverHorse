#!/bin/bash
scp -i ~/.ssh/id_rsa docker-compose.yaml jenkins@swarm-manager:/home/jenkins/docker-compose.yaml
ssh -i ~/.ssh/id_rsa jenkins@swarm-manager << EOF
    export DATABASE_URI=${DATABASE_URI}
    export SECRET_KEY=${SECRET_KEY}
    export BUILD_NUMBER=${BUILD_NUMBER}
    docker stack deploy --compose-file /home/jenkins/docker-compose.yaml OneCleverHorse
EOF
