# OneCleverHorse
A docker swarm password generator based on an XKCD cartoon

![XKCD Cartoon in question](https://imgs.xkcd.com/comics/password_strength.png)

# Architecture

## Micro-service architecture 

                  Web Client
    {            Load Balancer             }    
    [               Docker                 ]    
    DB Stack -> APP Stack -> Webfront Stack     
    (DB INST)   (APP INST)   (WEB INST)
    (DB INST)   (APP INST)   (WEB INST)
    (DB INST)   (APP INST)   (WEB INST)
    (DB INST)   (APP INST)   (WEB INST)
    (DB INST)   (APP INST)   (WEB INST)
    (DB INST)   (APP INST)   (WEB INST)
    (DB INST)   (APP INST)   (WEB INST)

## Service 1
Front end, powered by Flask, HTML, CSS and Javascript. Assembles everything and shows it all nicely using Twitter Bootstrap styling.
## Service 2
Fetches 4 random words of length 4 to 7.
## Service 3
Picks two of these words and adds symbolism replacement.
## Service 4
Is a Database to hold all the users and their passwords.

# Development Environment
## GCP Server Setup
1. Boot up GCP Server
2. Edit instance and place key gennereated using     ssh-keygen
3. ssh into server public IPv4 using Powershell
4. Use VSCode Plug in to now connect into the server which should be listed as a remote connection. 

For more info : <https://code.visualstudio.com/docs/remote/ssh>

## Tools

+ Ubuntu 18.04
+ MS Visual Studio Code 
+ Twitter Bootstrap 5
+ Jenkins
+ Docker
+ Docker Swarm
+ Trello

## Takeaways from previous project

1. Avoid feature creep, really trim this project <https://github.com/78afec35/Personal-Project>
2. Focus on success early on by reading the requirements
3. Integrate early on.

## Kanban board

Using Trello as a kanban board - <https://trello.com/b/Ko3b7CXN/onecleverhorse>

![Trello](./ReadmeAssets/Trello.png)

## Docker Compose Installation Script

    # make sure jq & curl is installed
    sudo apt update
    sudo apt install -y curl jq
    # set which version to download (latest)
    version=$(curl -s https://api.github.com/repos/docker/compose/releases/latest | jq -r '.tag_name')
    # download to /usr/local/bin/docker-compose
    sudo curl -L "https://github.com/docker/compose/releases/download/${version}/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    # make the file executable
    sudo chmod +x /usr/local/bin/docker-compose

## Docker Swarm - Worker Creation Startup Script

    #!/bin/bash 
    sudo apt update
    sudo apt install build-essential -y 
    sudo apt install docker.io -y
    sudo groupadd docker
    sudo gpasswd -a $USER docker
    sudo reboot
    docker swarm join --token SWMTKN-1-5qh189liw1ahad0yen6kbf6stl0qxkez1144wn7azwg4w9ide8-7jgw3pql5nlkvii8f2ejht9pi 10.154.0.9:2377

## Jenkins Setup


# Version Control

## Github

## Local Docker Repository

# Testing 

# Demo