#!/bin/bash


function ksln_param {


# MODIFIABLE - Paramètres de votre page home

	local page_name="PARAMETRAGES_INITIAUX"
	local page_color=${PURPLE}
	local page_bck_color=${BCK_PURPLE}
	local page_master="konnect"
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL

	conda_env_verif
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color}  




# Version OS Check

case "$OSTYPE" in
  darwin*)  
  	echo "Installation pour : OSX" 
  	tmp_pid_idx="2"
  	tmp_editor="TextEdit"
  	;; 
  linux*)   
  	echo "Installation pour : LINUX" 
  	tmp_pid_idx="2"
  	tmp_editor="gedit"
  	;;
  	
  msys*)    
  	echo "Installation pour : WINDOWS"
  	tmp_pid_idx="1"
  	tmp_editor="notepad"
  	;;
  	
  cygwin*)  
  	echo "Installation pour : WINDOWS" 
  	tmp_pid_idx="1"
  	tmp_editor="notepad"
  	;;
  *)        
  	echo "unknown: $OSTYPE" ;;
esac


sed -i -e "s|${PID_IDX}|${tmp_pid_idx}|g" ${PATH_PARAM}
sed -i -e "s|${TEXT_EDITOR}|${tmp_editor}|g" ${PATH_PARAM}

















# Modification de PRJ_PATH depuis PATH_ORIGIN

d=${PATH_ORIGIN}/server/lib/projects
sed -i -e "s|${PRJ_PATH}|$d|g" ${PATH_PARAM}
echo -e "\n  Etape 1 - ${GREEN}Terminée${NC} : Projets paramètrés\n"


echo -e ${LINE_SIMPLE}



# Modification de FORGE_PATH depuis PATH_ORIGIN

d=${PATH_ORIGIN}/server/lib/forge/Forge.csv
sed -i -e "s|${FORGE_PATH}|$d|g" ${PATH_PARAM}
echo -e "\n  Etape 2 - ${GREEN}Terminée${NC} : Forge paramètrée\n"

echo -e ${LINE_SIMPLE}







# Git configuration

ksln_header "" "PARAMETRAGE DE GIT" ${page_bck_color} 


echo -e "\n  Les informations demandées maintenant ${DIM}(nom et mail)${NC} sont là pour aider à constituer un historique."

echo -e "\n  ${DIM}Elles ne sont pas obligatoires, mais ${WHITE}fortement recommandées.${NC} Tapper entrée pour continuer" && read

echo -e "\n\n  - Quel est ${GREEN}votre nom${NC} :" && read git_name && git config --global --replace-all user.name ${git_name}

echo -e "\n\n  - Quel est ${GREEN}votre adresse mail${NC} :" && read git_mail && git config --global --replace-all user.email ${git_mail}

git config --global core.editor ${tmp_editor}

echo -e "\n  Etape 3 - ${GREEN}Terminée${NC} : Git paramètré"

echo -e ${LINE_SIMPLE}






# Création des environnements nécessaires à Konnect

ksln_header "" "CREATION ENVIRONNEMENT" ${page_bck_color} 

conda config --add channels conda-forge

echo -e ${LINE_DOUBLE}

echo -e "\n  Initialisation de l'environnement mercury, veuillez patienter quelques instants ..."

conda create --name mercury python

echo -e ${LINE_DOUBLE}

echo -e "\n  Initialisation de l'environnement ke1, veuillez patienter quelques instants ..."

conda create --name ke1 python gh

conda activate ke1

conda_change

echo -e "\n  Etape 4 - ${GREEN}Terminée${NC} : Initialisation des environnements terminée." 

echo -e ${LINE_SIMPLE}








# GitHub Client CLI configuration

ksln_header "" "AUTHENTIFICATION A GITHUB" ${page_bck_color} 

gh auth login --web

echo -e "\n  Etape 5 - ${GREEN}Terminée${NC} : Connecté à GitHub par le terminal"

echo -e ${LINE_SIMPLE}






# Heroku login

ksln_header "" "AUTHENTIFICATION A HEROKU" ${page_bck_color} 

heroku login

echo -e "\n  Etape 5 - ${GREEN}Terminée${NC} : Connecté à Heroku par le terminal"

echo -e ${LINE_SIMPLE}

















# Initialisation de conda avec le terminal bash

# ksln_header "" "INITIALISATION DE CONDA AVEC BASH" ${page_bck_color} 

# conda init bash

# echo -e "\n  INITIALISATION - ${GREEN}Terminée${NC}\t${GREEN}Appuyer sur entrée${NC} pour continuer" && read 





# Modification de PRJ_PATH depuis PATH_ORIGIN

d="KONNECT_IS_INIT"
sed -i -e "s|${KONNECT_INIT}|$d|g" ${PATH_PARAM}


# ---

echo -e ${LINE_DOUBLE}

echo -e "  ${GREEN}BRAVO !${N} installation fini à 95% ${RED}vous devez maintenant${NC} :
	
	1. ${GREEN}Taper entrée${NC}
	2. puis entrer la commande ${GREEN}bash konnect.sh${NC} et entrée
	3. (essentiel) dans Konnect, taper ${GREEN}k04 > 11${NC} pour finir d'installer les environnements ke1 et mercury" && read
	
cd ${PATH_ORIGIN}

	exit
}
