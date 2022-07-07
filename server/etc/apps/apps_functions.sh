#!/bin/bash

function apps_home {

# A MODIFIER - Paramètres de votre page home

	local page_name="GESTION_APPLICATIONS"
	local page_color=${PURPLE}
	local page_bck_color=${BCK_PURPLE}
	local page_master="apps_home"
	
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color} 
	
	
		
# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color}
	
# CORPS DE LA FONCTION

	ksln_links

	echo -e "\n  - ${WHITE}Mkdocs${NC}\t${GREEN}1${NC}. Lancer\t${RED}2${NC}. Éteindre\n"

	echo -e "  - ${WHITE}Jupyter${NC}\t${GREEN}3${NC}. Lancer\t${RED}4${NC}. Éteindre\n"
	
	echo -e "  - ${WHITE}Mercury${NC}\t( ${DIM}Disponible prochainement${NC} )\n"
	
	echo -e "  - ${WHITE}Spyder${NC}\t${GREEN}7${NC}. Lancer\t${RED}8${NC}. Éteindre\n\n"

	echo -e "\t\t\t\t\t\t\t\t\t\t\t\t     ${RED}9${NC}. Tout désactiver"
	
	echo -e "${LINE_SIMPLE}"

# RACCOURCI


# CHOICE / READ / ACTION
	
	list_choice=("" "apps_mkdocs_serve" "apps_mkdocs_down" \
		     "apps_jupyter_nb" "apps_jupyter_down" \
		     "" "" \
		     "apps_spyder" "apps_spyder_down"\
		     "apps_down")
	
	
ksln_answer "PURPLE" && read CHOICE && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "9" "apps_home" && ${list_choice[$CHOICE]}

# REFRESH

	apps_home
}





function apps_spyder {

	spyder &

}










function apps_mkdocs_serve {

echo -ne "\e]0;Konsilion Hub - Mkdocs\a"
# apps_mkdocs_down

# HEADER
	
	ksln_subheader " ${RED}TACHE DE FOND${NC} - DOCUMENTATION " "LECTURE"
	
# CORPS DE LA FONCTION



	local path_doc=${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/mkdocs
	
	if [[ ! -d "$path_doc" ]]; then
		echo -e "\n\n${GREEN}  [i]${NC} La documentation n'existe pas encore"\
		"${GREEN}  Entrer${NC} pour raffraichir la page."		&& read
	
		prj_home
	fi



		
	cd ${PRJ_PATH}/mkdocs

	echo -e " 
	• La documention s'ouvre à l'adresse suivante : http://localhost:8000\n 
	• (${RED}IMPORTANT : Appuyez sur Ctrl+C${NC} pour quitter,${RED} /!\ NE FERMEZ PAS LA PAGE /!\ ${NC})\n 
	• ${GREEN}Une nouvelle instance Hub${NC} est en cours de chargement, ${GREEN}veuillez patienter${NC}"
	
	echo -e ${LINE_DOUBLE}
	
	mkdocs serve &
}


function apps_mkdocs_ghdeploy {

	cd ${PRJ_PATH}/mkdocs

	mkdocs gh-deploy &
	
	echo -e "\n  ${CONTINUE_PHRASE}\n" && read 

}

	
function apps_jupyter_nb {

# HEADER	
	echo -ne "\e]0;Konsilion Hub - Jupyter Notebook\a"
	ksln_subheader " ${RED}TACHE DE FOND${NC} - DOCUMENTATION " "MODIFICATION"
	
# CORPS DE LA FONCTION

	
	cd ${PRJ_PATH}

	echo -e " 
	• La documention s'ouvre à l'adresse suivante : http://localhost:8000\n 
	• (${RED}IMPORTANT : Appuyez sur Ctrl+C${NC} pour quitter,${RED} /!\ NE FERMEZ PAS LA PAGE /!\ ${NC})\n 
	• ${GREEN}Une nouvelle instance Hub${NC} est en cours de chargement, ${GREEN}veuillez patienter${NC}"
	

	echo -e ${LINE_DOUBLE}
	
	jupyter notebook &
}
	
	
function apps_jupyter_lab {

echo -ne "\e]0;Konsilion Hub - Jupyter Lab\a"

# HEADER

	ksln_subheader " ${RED}TACHE DE FOND${NC} - DOCUMENTATION " "MODIFICATION"
	
# CORPS DE LA FONCTION
	
	conda activate ${CONDA_NAME} # Vraiment utile ?
	
	cd ${PRJ_PATH}

	echo -e " 
	• La documention s'ouvre à l'adresse suivante : http://localhost:8000\n 
	• (${RED}IMPORTANT : Appuyez sur Ctrl+C${NC} pour quitter,${RED} /!\ NE FERMEZ PAS LA PAGE /!\ ${NC})\n 
	• ${GREEN}Une nouvelle instance Hub${NC} est en cours de chargement, ${GREEN}veuillez patienter${NC}"
	

	echo -e ${LINE_DOUBLE}
	
	jupyter lab &
}
	

function apps_mercury_run {

echo -ne "\e]0;Konsilion Hub - Mercury\a"

# HEADER
	
	ksln_subheader " ${RED}TACHE DE FOND${NC} - NOTEBOOKS " "MERCURY"

# CORPS DE LA FONCTION
	
	conda activate "base"
	
	cd ${PRJ_PATH}/main/notebooks

	echo -e " 
	• La documention s'ouvre à l'adresse suivante : http://localhost:8000\n 
	• (${RED}IMPORTANT : Appuyez sur Ctrl+C${NC} pour quitter,${RED} /!\ NE FERMEZ PAS LA PAGE /!\ ${NC})\n 
	• ${GREEN}Une nouvelle instance Hub${NC} est en cours de chargement, ${GREEN}veuillez patienter${NC}"
	
	echo -e ${LINE_DOUBLE}
	
	mercury run &
}






















function apps_mkdocs_down {

echo -ne "\e]0;Konsilion Hub - Éteindre Mkdocs\a"

# HEADER
	
	ksln_subheader "Mkdocs > " "ÉTEINDRE"

# CORPS DE LA FONCTION

	if ps aux | grep 'mkdocs'| grep -v grep; then		
		if [ ${PID_IDX} == 1 ]; then
			kill $(ps aux | grep 'mkdocs' | grep -v grep | awk '{print $1}')
		elif [ ${PID_IDX} == 2 ]; then
			kill $(ps aux | grep 'mkdocs' | grep -v grep | awk '{print $2}')
		fi	
	fi	
	
	echo -e "\n  - Instance Mkdocs éteinte ...\n\n${CONTINUE_PHRASE}"
	
	read
}




function apps_jupyter_down {

echo -ne "\e]0;Konsilion Hub - Éteindre Jupyter\a"

# HEADER
	
	ksln_subheader " Jupyter > " "ÉTEINDRE"

# CORPS DE LA FONCTION

	if ps aux | grep 'jupyter'| grep -v grep; then	
		if [ ${PID_IDX} == 1 ]; then
			kill $(ps aux | grep 'jupyter' | grep -v grep | awk '{print $1}')
		elif [ ${PID_IDX} == 2 ]; then
			kill $(ps aux | grep 'jupyter' | grep -v grep | awk '{print $2}')
		fi
	fi	
	
	echo -e "\n  - Instances Jupyter ${GREEN}éteinte.${NC}\n\n${CONTINUE_PHRASE}"
	
	read
}




function apps_mercury_down {

echo -ne "\e]0;Konsilion Hub - Éteindre Mercury\a"

# HEADER
	
	ksln_subheader " Mercury > " "ÉTEINDRE"

# CORPS DE LA FONCTION

	if ps aux | grep 'mercury'| grep -v grep; then	
		if [ ${PID_IDX} == 1 ]; then
			kill $(ps aux | grep 'mercury' | grep -v grep | awk '{print $1}')
		elif [ ${PID_IDX} == 2 ]; then
			kill $(ps aux | grep 'mercury' | grep -v grep | awk '{print $2}')
		fi
	fi	
	
	echo -e "\n  - Instance Mercury ${GREEN}éteinte.${NC}\n\n${CONTINUE_PHRASE}"
	
	read
}



function apps_spyder_down {

echo -ne "\e]0;Konsilion Hub - Éteindre Spyder\a"

# HEADER
	
	ksln_subheader " Spyder > " "ÉTEINDRE"

# CORPS DE LA FONCTION

	if ps aux | grep 'spyder'| grep -v grep; then	
		if [ ${PID_IDX} == 1 ]; then
			kill $(ps aux | grep 'spyder' | grep -v grep | awk '{print $1}')
		elif [ ${PID_IDX} == 2 ]; then
			kill $(ps aux | grep 'spyder' | grep -v grep | awk '{print $2}')
		fi
	fi	
	
	echo -e "\n  - Instance Spyder ${GREEN}éteinte.${NC}\n\n${CONTINUE_PHRASE}"
	
	read
}















function apps_down {


	apps_mkdocs_down

	apps_jupyter_down
	
	apps_mercury_down
	
	apps_spyder_down

}
