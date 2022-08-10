#!/bin/bash
function conda_home {

# A MODIFIER - Paramètres de votre page home

	local page_name="ENVIRONNEMENTS_DEVELOPPEMENT"
	local page_color=${GREEN}
	local page_bck_color=${BCK_GREEN}
	local page_master="conda_home"
	
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL
	
	conda_env_verif
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color} 
	
		
# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color}


# CORPS DE LA FONCTION

	ksln_links
	
	echo -e "\n  Cannaux de téléchargement\t${GREEN}1${NC}. Ajouter\t${GREEN}2${NC}. Lister\t${RED}3${NC}. Supprimer\n\n"

	echo -e "  Applications et Packages\t${GREEN}4${NC}. Ajouter\t${GREEN}5${NC}. Lister\t${GREEN}6${NC}. Mettre à jour\t${RED}7${NC}. Supprimer\n\n"
	
	echo -e "  Les environnements\t\t${GREEN}8${NC}. Ajouter\t${GREEN}9${NC}. Lister\t${GREEN}10${NC}. Activer\n\n"
	
	echo -e "\n  ${DIM}Installer environnements pour Konnect${NC} .${GREEN}11${NC}\t\t\t\t\t\t${RED}12${NC}. Supprimer cet environnement"
		
	echo -e ${LINE_SIMPLE}

# RACCOURCI

# QUESTION / CHOIX / ACTION
			 
	list_choice=("" "conda_channels_add" "conda_channels_list" "conda_channels_rmv" \
		     "conda_pckg_add" "conda_pckg_list" "conda_pckg_update" "conda_pckg_rmv" \
		     "conda_env_add" "conda_env_list" "conda_env_activate" "conda_param" \
		     "conda_env_rmv")
		     
	ksln_answer "GREEN" && read CHOICE && cd ${PRJ_PATH} && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "12" "conda_home" && ${list_choice[$CHOICE]}

# REFRESH

	conda_home
	
}




function conda_param {

local choice_env
local pc_type

	echo -e "  Quel environnement souhaitez vous créer ? ${RED} /!\ ${NC}  Les deux sont obligatoires pour le ${GREEN}fonctionnement total${NC} de Konnect"
	
	echo -e "
	 ${GREEN}1${NC}. ${DIM}ke1${NC} : utiliser pour les fonctionnalités de Konnect (hors applications web) 
	 ${GREEN}2${NC}. ${DIM}mercury${NC} : utiliser pour les applications web uniquement"



read choice_env && echo -e ${LINE_DOUBLE}

case ${choice_env} in

	1)				
		echo -e "  Comment définiriez vous la puissance de votre ordinateur ?\n
 	${GREEN}1${NC}. ${DIM}Puissant${NC} : la création de l'environnement sera faite en une seul fois.
 	${GREEN}2${NC}. ${DIM}Normal${NC}  ${WHITE}(recommandé)${NC} : la création de l'environnement sera faite en trois fois."
	

		read pc_type && echo -e ${LINE_DOUBLE}
		
		ksln_header "" "AJOUT DES PACKAGES ESSENTIELS : ke1" ${BCK_PURPLE}
		
		echo -e "\n
		Cette opération peut être ${RED}réellement longue${NC}. même si 'failed' est indiqué ne quittez pas,
		conda cherche à ${GREEN}conscillier les dépendances de vos packages${NC} au sein de votre
		environnement de développement : ${WHITE}ke1${NC}
		
		Pour forcer l'arrêt : ${RED}Ctrl + C${NC}\n"

		conda create --name ke1 python
		
		conda activate ke1
		
	
		case ${pc_type} in

			1)
				ksln_header "" "INSTALLATION DE TOUT LES PACKAGES" ${BCK_PURPLE}
				conda install spyder jupyter jupyterlab nodejs mkdocs mkdocs-material mkdocs-macros-plugin mike jupyter-book
				;;
			2)
				
				ksln_header "" "INSTALLATION GitHub CLI, Spyder, Jupyter et JupyterLab" ${BCK_PURPLE}
				conda install gh spyder jupyter jupyterlab
				
				ksln_header "" "INSTALLATION Nodejs, Mkdocs, Mkdocs-material" ${BCK_PURPLE}
				conda install nodejs mkdocs mkdocs-material
				
				ksln_header "" "INSTALLATION Mkdocs macros, Mike et JupyterBook" ${BCK_PURPLE}
				conda install mkdocs-macros-plugin mike jupyter-book
				;;
			
			*)
				;;
			
		esac
		
		;;
	     	
     	2)
		conda activate mercury

		ksln_header "" "AJOUT DES PACKAGES ESSENTIELS : mercury" ${BCK_PURPLE}
		
		echo -e "\n
		Cette opération peut être ${RED}réellement longue${NC}. même si 'failed' est indiqué ne quittez pas,
		conda cherche à ${GREEN}conscillier les dépendances de vos packages${NC} au sein de votre
		environnement de développement : ${WHITE}mercury${NC}
		
		Pour forcer l'arrêt : ${RED}Ctrl + C${NC}\n"

		conda install mercury

		conda install jupyterlab nodejs
		
		conda activate ke1

		;;
     	*)
     		echo -e "\n  Aucune réponse séléctionnée. Appuyer sur entrée pour continuer..."
     	
		;;
esac
}




















function conda_env_activate {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements activation\a"
	ksln_subheader "ENVIRONNEMENTS DE DEV. > " "ACTIVATION"

# INFORMATIONS

	echo ""

	conda env list
	
	echo -e ${LINE_SIMPLE}
  
# CORPS DE LA FONCTION

	echo -e "  • ${GREEN}Nom de l'environnement${NC}\n"
	
	read  env_name
		
	conda activate $env_name
	
	conda_change
	
	echo -e ${LINE_DOUBLE}

	conda env list
	
	echo -e ${LINE_DOUBLE}
	
	echo -e "Vérifier votre nouveau environnement par '*' (${GREEN}Appuyer sur entrée${NC} pour continuer)"

	read
	
	ksln_bash_konnect
	
}

function conda_env_deactivate {

local base_name="base"

# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements désactivation\a"

	ksln_subheader " ENV. DE DEVELOPPEMENT" "DESACTIVATION"

if [ ${CONDA_NAME} == ${base_name} ]; then

	echo -e "\n\n\t/!\ L'environnement actuel est celui de ${GREEN}base${NC}. Il est ${RED}impossible de quitter${NC} \
cet environnement.\n\n"
	
	echo -e ${CONTINUE_PHRASE} && read
	
	conda_home

else

# INFORMATIONS

	conda env list
	
	echo -e ${LINE_SIMPLE}
	
# CORPS DE LA FONCTION
	
	echo -e " Desactivation de l'environnement en cours ...\n"
	
	conda deactivate
	
	conda_change
		
	echo -e "Vérifier votre nouveau environnement par '*'"
	
	conda_env_list
	
	ksln_bash_konnect
	
fi	
}



function conda_env_verif {

if [[ ${PRJ_NAME} = "apps" ]]; then

	if [[ ${CONDA_DEFAULT_ENV} != "mercury" ]]; then
	
		conda activate mercury

	fi

else

	if [[ ${CONDA_DEFAULT_ENV} != ${CONDA_NAME} ]]; then
		
		conda activate ${CONDA_NAME}

	fi
	
fi
}








function conda_env_rmv {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements supressions\a"
	ksln_subheader "ENVIRONNEMENTS DE DEVELOPPEMENTS" "SUPPRESSION"

local base_name="base"

if [ ${CONDA_NAME} == ${base_name} ]; then

	echo -e "\n\n\t/!\ L'environnement actuel est celui de ${GREEN}base${NC}. Il est ${RED}impossible de supprimer${NC} \
cet environnement.\n\n"
	
	echo -e ${CONTINUE_PHRASE} && read
	
	conda_home

else

	ksln_continue_risk
	
	echo -e " Desactivation de l'environnement en cours ...\n"

	conda deactivate
		
	echo -e " Suppression de l'environnement en cours ...\n"

	conda remove --name ${CONDA_NAME} --all
	
	conda_change

	echo -e ${LINE_DOUBLE}

	conda_env_list
	
	ksln_bash_konnect
fi
}

function conda_env_add {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements création\a"
	
	ksln_subheader "ENVIRONNEMENTS DE DEVELOPPEMENTS" "CRÉATION"
	
# INFORMATIONS

	conda env list	
	echo -e "${LINE_SIMPLE}\n"
	
# CORPS DE LA FONCTION
	
	echo -e "  • ${GREEN}Nom de l'environnement à créer ${NC}? (${RED}attention${NC} : Opération ~ longue)\n"
	
	read  env_name
	
	echo -e "\n  • ${GREEN}Version de Pyhton${NC} (ex: python ou python==3.9.2)?\n"
	
	
	read  py_version
	
	echo -e "\n  • ${GREEN}Liste des packages à installer${NC} (ex: jupyterlab ou jupyterlab==3.4.4)?\n"
	
	read  list_pkg
	
	echo -e ${LINE_DOUBLE}
	
	echo -e "\n Création de l'environnement en cours ...\n"
	
	echo -e "\n
	Cette opération peut être ${RED}réellement longue${NC}. même si 'failed' est indiqué ne quittez pas,
	conda cherche à ${GREEN}conscillier les dépendances de vos packages${NC} au sein de votre
	environnement de développement : ${WHITE}${env_name}${NC}
	
	Pour forcer l'arrêt : ${RED}Ctrl + C${NC}\n"
	
	conda create --name $env_name $py_version $list_pkg
	
	conda activate $env_name
	
	conda_change
	
	echo -e ${LINE_DOUBLE}

	conda env list
	
	echo -e ${LINE_DOUBLE}
	
	echo -e "Vérifier votre nouveau environnement par '*' (${GREEN}Appuyer sur entrée${NC} pour continuer)"

	read
	
	ksln_bash_konnect

}

function conda_env_list {

	conda env list	
	echo -e "${LINE_SIMPLE}\n"
	
	echo -e ${CONTINUE_PHRASE} && read
	
}

function conda_change {

sed -i -e "s|${CONDA_NAME}|${CONDA_DEFAULT_ENV}|g" ${PATH_ENV}

}

function conda_env_import {


# HEADER
	echo -ne "\e]0;Konsilion Hub - Environnements import\a"
	ksln_subheader "ENVIRONNEMENTS DE DEVELOPPEMENTS > " "IMPORT"
	
# INFORMATIONS

	conda env list
	
	echo -e ${LINE_SIMPLE}
	
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


function conda_pckg_update {

# HEADER
	echo -ne "\e]0;Konsilion Hub - Packages\a"
	ksln_subheader "PACKAGES > " "MISE A JOUR"
	
# CORPS DE LA FONCTION

	echo -e "\n  Chargement des packages en cours ...\n"

	conda list
	
	echo -e "\n  • ${GREEN}Nom du paquet à mettre à jour${NC} :\n"
	
	read  pckg_name
	
	echo -e "\n
	Cette opération peut être ${RED}réellement longue${NC}. Conda mets à jour le package ${pckg_name} au sein de votre
	environnement de développement : ${WHITE}${CONDA_NAME}${NC}
	
	Pour forcer l'arrêt : ${RED}Ctrl + C${NC}\n"	

	echo -e ${LINE_DOUBLE}
	
	conda update --name ${CONDA_NAME} ${pckg_name}

	echo -e "\n${CONTINUE_PHRASE}" && read
	
}
