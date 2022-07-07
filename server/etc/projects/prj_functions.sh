#!/bin/bash
function prj_home {


# A MODIFIER - Paramètres de votre page home

	local page_name="PROJETS"
	local page_color=${CYAN}
	local page_bck_color=${BCK_CYAN}
	local page_master="prj_home"
	
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color} 
	
			 
if [[ ${PRJ_LOAD} = 1 ]]; then

# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color}

# CORPS DE LA FONCTION
	
	ksln_links
	
	echo -e "\n  - ${WHITE}Documentation${NC}\t\t${GREEN}3${NC}. Ouvrir\t${GREEN}4${NC}. Modifier\t${GREEN}5${NC}. Publier     |     (Créer une documentation .${GREEN}6${NC})\n"
	
	echo -e "  - ${WHITE}Modèlisations${NC}\t\t${GREEN}7${NC}. Spyder\t${GREEN}8${NC}. Jupyter NB\t${GREEN}9${NC}. Jupyter Lab\t\n"
	
	echo -e "  - ${WHITE}Notebooks interactifs${NC}\t( ${DIM}Disponible prochainement${NC} )\n\n"
	
	echo -e "  - ${WHITE}Prototypes${NC}\t\t\t( ${DIM}Disponible prochainement${NC} )\n"
		
	echo -e "\n\n\n\t\t\t${GREEN}10${NC}. Nouveau projet     |     ${GREEN}11${NC}. Changer     |     ${GREEN}12${NC}. Sortir     |     ${RED}13${NC}. Supprimer ce projet"
		
	echo -e ${LINE_SIMPLE}
		
else	
	# RACCOURCI
	
	echo -e "  ${GREEN}1${NC}. Ouvrir un projet	  ${GREEN}2${NC}. Nouveau projet"
	echo -e "${LINE_SIMPLE}\n"
	
	# INFORMATIONS
	prj_list

fi

# QUESTION / CHOIX / ACTION

	
	list_choice=("" "prj_activate" "prj_add" \
		     "apps_mkdocs_serve" "apps_jupyter_nb" "apps_mkdocs_ghdeploy" "prj_doc_create" \
		     "spyder" "apps_jupyter_nb" "apps_jupyter_lab" \
		     "prj_add" "prj_activate" "prj_deactivate" "prj_rmv")
	
	ksln_answer "CYAN" && read CHOICE && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "13" "prj_home" && ${list_choice[$CHOICE]}
	
# REFRESH

	prj_home
}












function prj_open {

	xdg-open .
	
	prj_home
}





function prj_list {
  
	search_dir=${PRJ_PATH_ORIGIN}

	echo -e "  Tous les projets :"

	array=()
	tempi=1
	for file in "$search_dir"/*; do
		echo -e "  - $(basename "$file")"
	done

	echo -e ${LINE_SIMPLE}
}




function prj_list_num {
  
	search_dir=${PRJ_PATH_ORIGIN}
    
	echo -e "  Tous les projets :\n"

	array=()
	tempi=1
	for file in "$search_dir"/*; do
		echo -e " $tempi . $(basename "$file")"
		array[$tempi]=$file
		((tempi+=1))
	done
	
	echo -e ${LINE_DOUBLE}
}

function prj_add {

echo -ne "\e]0;Konsilion Hub - Projet création\a"

# HEADER
	
	ksln_header " PROJETS > " "CRÉATION"

# INFORMATIONS - Copier de list prj_num

	prj_list

# CORPS DE LA FONCTION

	echo -e "\n  • ${GREEN}Nom du projet ${NC}?"
	
	read  prj_name
	
	mkdir ${PATH_ORIGIN}/server/lib/projects/${prj_name}
	
	cp -r ${PATH_ORIGIN}/server/lib/templates/project/* ${PATH_ORIGIN}/server/lib/projects/${prj_name}
		
	cd ${PATH_ORIGIN}/server/lib/projects/${prj_name}

	echo -e ${LINE_DOUBLE}
		
	prj_change ${PWD}
}







function prj_rmv {

echo -ne "\e]0;Konsilion Hub - Projets suppressions\a"

# HEADER
	
	ksln_header " PROJETS > " "SUPPRESSION"

# CORPS DE LA FONCTION
	
	echo -e " Desactivation du projet ${PRJ_NAME} ...\n"
	
	cd ${PRJ_PATH_ORIGIN}
	
	echo -e " Suppression du projet ${PRJ_NAME} ... "

	rm -rf ${PRJ_PATH}

	echo -e "\n ${GREEN}terminée${NC}."

	echo -e ${LINE_DOUBLE}

	echo -e ${CONTINUE_PHRASE} && read

	prj_change ${PRJ_PATH_ORIGIN}
}



function prj_activate {

# HEADER
	
	echo -ne "\e]0;Konsilion Hub - Projets ouverture\a"
	echo -e "$(ksln_subheader " PROJETS > " "ACTIVATION")\n"
	
# INFORMATIONS - Copier de list prj_num

	search_dir=${PRJ_PATH_ORIGIN}
    
	echo -e "Tous les projets :\n"

	array=()
	tempi=0
	#array[$tempi]=${PRJ_PATH}
	for file in "$search_dir"/*; do
		((tempi+=1))
		echo -e "$tempi . $(basename "$file")"
		array[$tempi]=$file
	done
	
	#(($tempi=$tempi-1))
	
	echo -e ${LINE_DOUBLE}
	
# CORPS DE LA FONCTION

	echo -e "  • ${GREEN}Numéro du projet à ouvrir ${NC}?\n"
	
	read  prj_num 
	
	if [[ -z "$prj_num" || $prj_num -gt $tempi || $prj_num -eq 0 ]]; then
		
		echo -e " ${GREEN}[i]${NC} Aucune séléction ... ${GREEN}continuer${NC} " && read
		prj_home
		
	fi

	cd ${array[${prj_num}]}

	prj_change ${PWD}

	echo -e ${LINE_DOUBLE}
	
}























function prj_deactivate {

	cd ${PATH_ORIGIN}/server/lib/projects

	prj_change ${PWD}

	prj_home

}

function prj_change {

d=$1
sed -i -e "s|${PRJ_PATH}|$d|g" ${PATH_ENV}
echo " Redemarage nécessaire ..."
cd ${PATH_ORIGIN}/server/etc && bash konnect.sh

}



function prj_doc_create {

echo -ne "\e]0;Konsilion Hub - Documentation création\a"

# HEADER
	
	ksln_subheader " DOCUMENTATION > " "CRÉATION"

# CORPS DE LA FONCTION
	
	local path_create=${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/mkdocs
	
	if [[ -d "$path_create" ]]; then
		echo -e "\n\n${GREEN}  [i]${NC} La documentation existe déjà. ${GREEN}Entrer${NC} pour continuer." && read
	
		prj_home
	fi
	

	mkdir ${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/mkdocs
	
	cp -r ${PATH_ORIGIN}/server/lib/templates/mkdocs/* ${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/mkdocs
		
	cd ${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/mkdocs

	echo -e ${LINE_DOUBLE}
	
	echo -e "\n  Documentation créée.\n"
	
	echo -e ${CONTINUE_PHRASE} && read
	
	# apps_mkdocs_serve
}
