#!/bin/bash

echo -e " ############################################################################\n\n      CHANGER LE DOSSIER DE MERCURY         \n\n ############################################################################\n"

SUB="'"

source .env

# Récupération du chemin actuel
FIND=${NOTEBOOKS_PATH}

echo -e " Bienvenue sur l'interface Konsilion,\n\n Vous souhaitez charger un nouveau dossier pour l'application Mercury.\n\n En cours d'utilisation : $FIND"

# Renseigner le nouveau chemin
echo -e "\n\n\n•••••  Faite glisser le nouveau dossier et appuyer sur entrée : "  

read TEMP
TEMP=${TEMP//$SUB/}

sed -i "s|$FIND|$TEMP|g" .env

source .env
FIND=${NOTEBOOKS_PATH}

echo -e "\n Le nouveau dossier pour l'application Mercury est : \n\n $FIND\n\n"

bash ./Eteindre.sh
bash ./Allumer.sh

read -p "Chemin modifié et application actualisée, vous pouvez fermer la page."
