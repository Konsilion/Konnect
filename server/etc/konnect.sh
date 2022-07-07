#!/bin/bash

#################### ENVIRONNEMENT KONSILION ###########################

. ./.env

. ${PATH_CONDA}/etc/profile.d/conda.sh

. ${PATH_ORIGIN}/server/etc/functions.sh

. ${PATH_ORIGIN}/server/etc/conda/conda_functions.sh

. ${PATH_ORIGIN}/server/etc/projects/prj_functions.sh

. ${PATH_ORIGIN}/server/etc/apps/apps_functions.sh

. ${PATH_ORIGIN}/server/etc/git/git_functions.sh

. ${PATH_ORIGIN}/server/etc/forge/frg_functions.sh

########################################################################



function konnect {

# A MODIFIER - Paramètres de votre page home

	local page_name="ACCUEIL"
	local page_color=${BLUE}
	local page_bck_color=${BCK_CYAN}
	local page_master="konnect"
	
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color} 
	
		
# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color}
	 
 
# CORPS DE LA FONCTION

	ksln_links

	echo -e "\n  Bienvenue sur votre Hub, sélectionnez une catégorie\n\n

	${BCK_CYAN}__${NC} : Gestion projets .${GREEN}1${NC}\t\t\t${BCK_PURPLE}__${NC} : Applications .${GREEN}3${NC}\n\n
	${BCK_YELLOW}__${NC} : Partage et versionning .${GREEN}2${NC}\t\t${BCK_GREEN}__${NC} : Environnements de développement .${GREEN}4${NC}\n\n\n

	${GREEN}5${NC} : Accèder à la Forge\t\t${GREEN}6${NC} : Paramètres\t\t${RED}Ctrl + C${NC} : Éteindre"

	echo -e "\n${LINE_SIMPLE}"
		
# CHOICE / READ / ACTION
	list_choice=("" "prj_home" "git_home" "apps_home" "conda_home" "frg_home" "nano ${PATH_ENV}")

	ksln_answer "CYAN" && read CHOICE && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "6" "konnect" && clear && ${list_choice[$CHOICE]}

# REFRESH
	
	ksln_bash_konnect
}

# PARAMETRAGES

cd ${PATH_ORIGIN} 

PRJ_LOAD=1
PRJ_NAME=$(basename "$PRJ_PATH")
if [[ ${PRJ_PATH_ORIGIN} = ${PRJ_PATH} ]]; then 
	PRJ_LOAD=0
	PRJ_NAME="Aucun projet chargé"
fi

conda activate ${CONDA_NAME}
cd ${PRJ_PATH}

konnect
