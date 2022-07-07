#!/bin/bash
function conda_home {

# A MODIFIER - Paramètres de votre page home

	local page_name="ENVIRONNEMENTS_DEVELOPPEMENT"
	local page_color=${GREEN}
	local page_bck_color=${BCK_GREEN}
	local page_master="conda_home"
	
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color} 
	
		
# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color}


# CORPS DE LA FONCTION
	
	echo -e "  - ${WHITE}Cannaux de téléchargement${NC}\t${GREEN}1${NC}. Ajouter\t${GREEN}2${NC}. Lister\t${RED}3${NC}. Supprimer\n\n"

	echo -e "  - ${WHITE}Applications et Packages${NC}\t${GREEN}4${NC}. Ajouter\t${GREEN}5${NC}. Lister\t${GREEN}6${NC}. Mettre à jour\t${RED}7${NC}. Supprimer\n\n\n\n"
	
	echo -e "  - ${WHITE}Les environnements${NC}\t\t${GREEN}8${NC}. Activer\t${GREEN}9${NC}. Créer\t${GREEN}10${NC}. Mettre à jour\t${GREEN}11${NC}. Importer (.yml)\n\n"
	
	echo -e "\n\n\t\t\t\t\t\t\t\t\t\t  ${GREEN}12${NC}. Sortir de l'env.  |  ${RED}13${NC}. Supprimer"
		
	echo -e ${LINE_SIMPLE}

# RACCOURCI

# QUESTION / CHOIX / ACTION
			 
	list_choice=("" "conda_channels_add" "conda_channels_list" "conda_channels_rmv" \
		     "conda_pckg_add" "conda_pckg_list" "" "conda_pckg_rmv" \
		     "conda_env_activate" "conda_env_add" "" "conda_env_import" \
		     "conda_env_deactivate" "conda_env_rmv")
		     
	ksln_answer "GREEN" && read CHOICE && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "13" "conda_home" && ${list_choice[$CHOICE]}

# REFRESH

	conda_home
	
}


function conda_env_activate {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements activation\a"
	ksln_subheader "ENVIRONNEMENTS DE DEV. > " "ACTIVATION"

# INFORMATIONS

	echo ""

	conda_env_list
  
# CORPS DE LA FONCTION

	echo -e "  • ${GREEN}Nom de l'environnement${NC}\n"
	
	read  env_name
	
	conda activate $env_name
	
	conda_change
	
	echo -e ${LINE_DOUBLE}

	conda env list
	
	echo -e ${LINE_DOUBLE}
	
	echo -e "Vérifier votre nouveau environnement par '*' (${GREEN}Appuyer sur entrée${NC} pour continuer)"


# CHOIX

	read
	
}

function conda_env_deactivate {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements désactivation\a"
	ksln_header " ACCUEIL > ENVIRONNEMENTS DE DEVELOPPEMENTS > " "DESACTIVATION"
	
# INFORMATIONS

	conda_env_list
	
# CORPS DE LA FONCTION
	
	echo -e " Desactivation de l'environnement en cours ...\n"
	
	conda deactivate
	
	conda_change
	
	conda_env_list
	
	echo -e "Vérifier votre nouveau environnement par '*' (${GREEN}Appuyer sur entrée${NC} pour continuer)"
	
	
# RACCOURCI

# CHOIX

# REFRESH

	read && conda_home
	
}

function conda_env_rmv {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements supressions\a"
	ksln_header " ACCUEIL > ENVIRONNEMENTS DE DEVELOPPEMENTS > " "SUPPRESSION"
	
# INFORMATIONS

	conda_env_list
	
# CORPS DE LA FONCTION
	
	echo -e "  • ${GREEN}Nom de l'environnement à supprimer ${NC}? (${RED}attention${NC} : Opération ~ longue)\n"
	
	
	read  env_name
	
	echo -e " Desactivation de l'environnement en cours ...\n"
	
	conda deactivate
	
	echo -e " Suppression de l'environnement en cours ...\n"

	conda remove --name $env_name --all

	echo -e ${LINE_DOUBLE}

	conda env list
	
	echo -e ${LINE_DOUBLE}
	
	echo -e ${CONTINUE_PHRASE}

}

function conda_env_add {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements création\a"
	ksln_header " ACCUEIL > ENVIRONNEMENTS DE DEVELOPPEMENTS > " "CRÉATION"
	
# INFORMATIONS

	conda_env_list
	
# CORPS DE LA FONCTION
	
	echo -e "  • ${GREEN}Nom de l'environnement à créer ${NC}? (${RED}attention${NC} : Opération ~ longue)\n"
	
	read  env_name
	
	echo -e "  • ${GREEN}Version de Pyhton ou R${NC}?\n"
	
	
	read  py_version
	
	echo -e "  • ${GREEN}Liste des packages à installer ${NC}?\n"
	
	read  list_pkg
	
	echo -e ${LINE_DOUBLE}
	
	echo -e "\n Création de l'environnement en cours ...\n"
	
	echo -e "\n
	Cette opération peut être ${RED}réellement longue${NC}. même si 'failed' est indiqué ne quittez pas,
	conda cherche à ${GREEN}conscillier les dépendances de vos packages${NC} au sein de votre
	environnement de développement : ${WHITE}${env_name}${NC}
	
	Pour forcer l'arrêt : ${RED}Ctrl + C${NC}\n"
	
	conda create --name $env_name $py_version $list_pkg
	
	echo -e ${LINE_DOUBLE}

	conda env list
	
	echo -e ${LINE_DOUBLE}
	
	echo -e ${CONTINUE_PHRASE}

}

function conda_env_list {

	conda env list	
	echo -e "${LINE_SIMPLE}\n"
}

function conda_change {

sed -i -e "s|${CONDA_NAME}|${CONDA_DEFAULT_ENV}|g" ${PATH_ENV}

}

function conda_env_import {


# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements import\a"
	ksln_subheader "ENVIRONNEMENTS DE DEVELOPPEMENTS > " "IMPORT"
	
# INFORMATIONS

	conda_env_list
	
# CORPS DE LA FONCTION
	
	
	echo -e "  • ${GREEN}Nom de l'environnement à créer ${NC}? (${RED}attention${NC} : Opération ~ longue)\n"
	
	read  env_name
	
	echo -e "  • ${GREEN}Chemin vers le fichier YML (faite glisser le fichier)${NC}\n"
	
	read  env_yml
	
	echo -e ${LINE_DOUBLE}
	
	echo -e "\n Création de l'environnement en cours ...\n"
	
	echo -e "\n
	Cette opération peut être ${RED}réellement longue${NC}. même si 'failed' est indiqué ne quittez pas,
	conda cherche à ${GREEN}conscillier les dépendances de vos packages${NC} au sein de votre
	environnement de développement : ${WHITE}${env_name}${NC}
	
	Pour forcer l'arrêt : ${RED}Ctrl + C${NC}\n"
	
	conda env create --name $env_name --file $env_yml
	
	echo -e ${LINE_DOUBLE}

	conda env list
	
	echo -e ${LINE_DOUBLE}
	
	echo -e ${CONTINUE_PHRASE}







}















function conda_channels_add {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Channels ajouts\a"
	ksln_subheader "CHANNELS > " "AJOUT"

# CORPS DE LA FONCTION

	echo ""

	conda config --show channels

	echo -e "\n  ${GREEN}•${NC} Nom du canal de téléchargement ?\n"
	
	read  chnl_name
	
	conda config --add channels $chnl_name
	
	echo -e ${LINE_DOUBLE}
	
	conda_channels_list

}

function conda_channels_rmv {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Channels suppressions\a"
	ksln_subheader "CHANNELS > " "SUPRESSION"

# INFORMATIONS

	echo ""

	conda config --show channels

# CORPS DE LA FONCTION

	echo -e "\n  ${GREEN}•${NC} Nom du canal de téléchargement ?\n"
	
	read  chnl_name
	
	conda config --remove channels $chnl_name
	
	echo -e ${LINE_DOUBLE}
	
	conda_channels_list
	
}

function conda_channels_list {

	conda config --show channels
	
	echo -e ${LINE_DOUBLE}
	
	echo -e ${CONTINUE_PHRASE} && read
}


function conda_pckg_list {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Channels & Packages\a"
	ksln_subheader "PACKAGES > " "LISTE"
	
# CORPS DE LA FONCTION

	echo -e "\n  Chargement des packages en cours ...\n"

	conda list

	echo -e "\n${CONTINUE_PHRASE}" && read
	
}

function conda_pckg_add {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Packages ajouts\a"
	ksln_subheader "PACKAGES > " "AJOUT"

# CORPS DE LA FONCTION

	echo	-e "\n  • ${GREEN}Nom du package ${NC}?\n"
	
	read  pkg_name
	
	echo -e "\n
	Cette opération peut être ${RED}réellement longue${NC}. même si 'failed' est indiqué ne quittez pas,
	conda cherche à ${GREEN}conscillier les dépendances de vos packages${NC} au sein de votre
	environnement de développement : ${WHITE}${env_name}${NC}
	
	Pour forcer l'arrêt : ${RED}Ctrl + C${NC}\n"	
	
	conda install $pkg_name

	echo -e ${LINE_DOUBLE}

	conda_pckg_list
}

function conda_pckg_rmv {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Package suppression\a"
	ksln_subheader "PACKAGES > " "SUPRESSION"

# INFORMATIONS


# CORPS DE LA FONCTION

	echo -e "\n  • ${GREEN}Nom du paquet à supprimer${NC} :\n"
	
	read  pckg_name
	
	echo -e "\n
	Cette opération peut être ${RED}réellement longue${NC}. même si 'failed' est indiqué ne quittez pas,
	conda cherche à ${GREEN}conscillier les dépendances de vos packages${NC} au sein de votre
	environnement de développement : ${WHITE}${env_name}${NC}
	
	Pour forcer l'arrêt : ${RED}Ctrl + C${NC}\n"	
	
	conda uninstall $pckg_name

	echo -e ${LINE_DOUBLE}
	
	echo -e ${CONTINUE_PHRASE}

}






