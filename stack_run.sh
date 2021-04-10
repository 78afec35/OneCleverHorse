#!/bin/bash
scp  docker-compose.yaml jenkins@swarm-manager:/home/jenkins/docker-compose.yaml
ssh  jenkins@swarm-manager << EOF
    export DATABASE_URI=${DATABASE_URI}
    export SECRET_KEY=${SECRET_KEY}
    export BUILD_NUMBER=${BUILD_NUMBER}
    docker stack deploy --compose-file /home/jenkins/docker-compose.yaml OneCleverHorse
EOF
