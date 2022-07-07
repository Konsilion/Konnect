#!/bin/bash

source .env

echo -e " ############################################################################\n\n      LANCEMENT DE L'APPLICATION HEDGEDOC sur le port ${PORT_HOST}        \n\n ############################################################################\n"

docker-compose up -d

echo "L'application va se lancer dans quelques secondes ..."

sleep 7

start http://127.0.0.1:3000/

read -p "Appuyer sur entree pour fermer la page."