# OneCleverHorse
A docker swarm password generator based on an XKCD cartoon

![XKCD Cartoon in question](https://imgs.xkcd.com/comics/password_strength.png)

# Architecture
## Service 1
Front end, powered by Flask, HTML, CSS and Javascript. Assembles everything and shows it all nicely using Twitter Bootstrap styling.
## Service 2
Fetches 4 random words of length 4 to 7.
## Service 3
Picks two of these words and adds symbolism replacement.
## Service 4
Is Database to hold all the users and their passwords.

# Development Environment
## GCP Server