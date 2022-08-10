#!/bin/bash

clear

# SCRIPT PRINCIPAL : Permet de mettre en place l'environnements et génère la page d'accueil Konnect.

#################### ENVIRONNEMENT KONSILION ###########################

# Indiquez ici tous les scripts secondaires.

. ./.env

. ./param.sh

. ${PATH_CONDA}/etc/profile.d/conda.sh		# Donne acces aux commandes conda dans le terminal - conda init issue

. ${PATH_ORIGIN}/server/etc/functions.sh

. ${PATH_ORIGIN}/server/etc/conda/conda_functions.sh

. ${PATH_ORIGIN}/server/etc/projects/prj_functions.sh

. ${PATH_ORIGIN}/server/etc/apps/apps_functions.sh

. ${PATH_ORIGIN}/server/etc/git/git_functions.sh

. ${PATH_ORIGIN}/server/etc/forge/frg_functions.sh

########################################################################


function konnect {

# COMMENTAIRES : La page principale Konnect présente les principales actions possible avec le HUB.

# MODIFIABLE - Paramètres de votre page home

	local page_name="ACCUEIL"
	local page_color=${BLUE}
	local page_bck_color=${BCK_CYAN}
	local page_master="konnect"
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL

	conda_env_verif
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color} 
	
# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color} && ksln_links	 

# MODIFIABLE - CORPS DE LA PAGE

	echo -e "\n

	${BCK_CYAN}__${NC} : Gestion projets .${GREEN}1${NC}\t\t\t${BCK_PURPLE}__${NC} : Applications .${GREEN}3${NC}\n\n
	${BCK_YELLOW}__${NC} : Partage et versionning .${GREEN}2${NC}\t\t${BCK_GREEN}__${NC} : Environnements de développement .${GREEN}4${NC}\n\n

	${GREEN}5${NC} : Accèder à la Forge\t\t${RED}Ctrl + C${NC} : Éteindre\n\n\n\n"
	
	echo -e "  ${DIM}Initialiser Konnect${NC} .${GREEN}6${NC}\t${DIM}Mettre à jour Konnect${NC} .${GREEN}7${NC}\t"

	echo -e "${LINE_SIMPLE}"
		
# CHOICE / READ / ACTION

	list_choice=("" "prj_home" "git_home" "apps_home" "conda_home" "frg_home" "ksln_param" "ksln_konnect_upgrade")

	ksln_answer "CYAN" && read CHOICE && cd ${PRJ_PATH} && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "7" "konnect" && clear && ${list_choice[$CHOICE]}

# REFRESH
	
	konnect
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