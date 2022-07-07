#!/bin/bash

echo -e " ############################################################################\n\n      INSTALLATION DE L'APPLICATION MERCURY depuis Git repo        \n\n ############################################################################\n"

### Check if a directory does not exist ###
if [ ! -d "./app/mercury" ] 
then
    echo "Directory ./app/mercury DOES NOT exists."
    cd ./app
    git clone https://github.com/mljar/mercury.git --config core.autocrlf=input
    #exit 9999 # die with error code 9999
    cd ../
fi

docker compose build --no-cache