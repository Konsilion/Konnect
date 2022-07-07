#!/bin/bash

source .env

echo -e " ############################################################################\n\n      LANCEMENT DE L'APPLICATION MERCURY sur le port ${PORT_HOST}        \n\n ############################################################################\n"

docker-compose up -d

echo "L'application va se lancer dans quelques secondes ..."

sleep 7

start http://127.0.0.1:${PORT_HOST}/