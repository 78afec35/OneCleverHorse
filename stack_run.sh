#!/bin/bash
ssh -tt -i ~/.ssh/id_rsa -o StrictHostKeyChecking=no jenkins@swarm-manager << EOF
    export DATABASE_URI=${DATABASE_URI}
    export SECRET_KEY=${SECRET_KEY}
    print SECRET_KEY
    print DATABASE_URI
    rm -rf OneCleverHorse
    git clone https://github.com/78afec35/OneCleverHorse
    cd OneCleverHorse
    pwd
    docker image prune -f -a
    docker rmi -f
    docker rm -f
    docker ps
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    docker-compose --version
    docker stack deploy --compose-file /home/jenkins/OneCleverHorse/docker-compose.yaml onecleverhorsestack
    docker stack services onecleverhorsestack
    pwd
EOF
