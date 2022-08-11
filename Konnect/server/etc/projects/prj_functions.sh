#!/bin/bash
function prj_home {


# A MODIFIER - Paramètres de votre page home

	local page_name="PROJETS"
	local page_color=${CYAN}
	local page_bck_color=${BCK_CYAN}
	local page_master="prj_home"
	
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL
	
	conda_env_verif
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color}
		
			 
if [[ ${PRJ_LOAD} = 1 ]]; then

# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color}

# CORPS DE LA FONCTION

	if [[ ${PRJ_NAME} = "apps" ]]; then

		echo -e "\n\n  Vous êtes actuellement dans votre dossier d'application Web (apps)\t${BLACK}${BCK_PURPLE} k03 ${NC}. Accèder aux applications\n\n"


	else	
		ksln_links
		
		prj_home_which_doc

		echo -e "${CYAN}${LINE_DOTTED}${NC}\n\n"
		
		echo -e "  Modélisation :\n"
		
			echo -e "  ${DIM}Jupyter Lab${NC}\t\t\t${GREEN}13${NC}. Ouvrir\t${RED}14${NC}. Eteindre\n"
		
			echo -e "  ${DIM}Spyder${NC}\t\t\t${GREEN}15${NC}. Ouvrir\t${RED}16${NC}. Eteindre\n"	
	fi
	
	
	
	echo -e ${LINE_DOTTED}
	
	echo -e "\n\t\t\t ${GREEN}20${NC}. Nouveau projet     |     ${GREEN}21${NC}. Changer     |     ${GREEN}22${NC}. Sortir     |     ${RED}23${NC}. Supprimer ce projet"
		
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
		     "apps_mkdocs_serve" "prj_IDE_website" "apps_mkdocs_down" \
		     "apps_mike_publish" "apps_mike_list" "apps_mike_delete" \
		     "apps_jb_serve" "prj_IDE_doc" "apps_jb_down" \
		     "apps_jb_publish" \
		     "apps_jupyter_lab" "apps_jupyter_down" \
		     "apps_spyder" "apps_spyder_down" \
		     "apps_mercury_run" "apps_mercury_watch" \
		     "apps_mercury_publish" \
		     "prj_add" "prj_activate" "prj_deactivate" "prj_rmv" \
		     "prj_doc_create" "prj_jb_create")
	
	ksln_answer "CYAN" && read CHOICE && cd ${PRJ_PATH} && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "25" "prj_home" && ${list_choice[$CHOICE]}
	
# REFRESH

	prj_home
}



function prj_IDE_website {

	cd ${PRJ_PATH}/mkdocs
	
	jupyter lab &
		
	echo -e "\n  Attendre 5-10 secondes que Jupyterlab démarre"
	
}


function prj_IDE_doc {

	cd ${PRJ_PATH}/JupyterBook
	
	jupyter lab &
	
	echo -e "\n  Attendre 5-10 secondes que Jupyterlab démarre"
	
}
	
	






function prj_home_which_doc {


	local mkdocs_exist=${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/mkdocs
	
	if [[ -d "$mkdocs_exist" ]]; then

		echo -e "\n  Site Web :\n"
	
		echo -e "  ${DIM}Modifications en local${NC}\t${GREEN}3${NC}. Ouvrir\t\t${GREEN}4${NC}. Modifier\t${RED}5${NC}. Eteindre\n"
	
		echo -e "  ${DIM}Publication & Versions${NC}\t${GREEN}6${NC}. Publier en ligne\t${GREEN}7${NC}. Versions\t${RED}8${NC}. Supprimer une version\n"

	


	fi


	local jpbook_exist=${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/JupyterBook
	
	if [[ -d "$jpbook_exist" ]]; then

		echo -e "\n  Documentation scientifique :\n"
	
		echo -e "  ${DIM}Modifications en local${NC}\t${GREEN}9${NC}. Ouvrir\t${GREEN}10${NC}. Modifier\t${RED}11${NC}. Eteindre\n"
	
		echo -e "  ${DIM}Publication :${NC}\t\t\t${GREEN}12${NC}. Publier en ligne\n"
		


	fi



	if [ ! -d "$mkdocs_exist" ] && [ ! -d "$jpbook_exist" ]; then
		
		echo -e "\n  Site Web :${NC}\t\t\t\t${GREEN}24${NC}. Créer"
		echo -e "${DIM}ou${NC}"
		echo -e "  Documentation scientifique :${NC}\t\t${GREEN}25${NC}. Créer\n"
		
	
	fi



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
	
	ksln_subheader " PROJETS > " "CRÉATION"

# INFORMATIONS - Copier de list prj_num

	prj_list

# CORPS DE LA FONCTION

	echo -e "\n  • ${GREEN}Nom du projet ${NC}?"
	
	read  prj_name
	
	echo -e "\n  • Voulez vous créer un ${GREEN}répertoire en ligne${NC} (recommandé) : [y]/n"
	
	read  prj_git
	
	if [ -z "$prj_name" ]; then
	
		echo "Nom (vide), aucun dossier créé"
				
		echo -e ${CONTINUE_PHRASE} && read
		
		return
			
	else
	
		mkdir ${PATH_ORIGIN}/server/lib/projects/${prj_name}
		
		cp -r ${PATH_ORIGIN}/server/lib/templates/project/* ${PATH_ORIGIN}/server/lib/projects/${prj_name}
				
		cd ${PATH_ORIGIN}/server/lib/projects/${prj_name}
					
	fi
		

	
	if [ "$prj_git" != "n" ]; then
	
		git_init
		
		echo -e ${LINE_DOUBLE}
		
		echo -e "\n\n  ${RED}Important${NC} : Vous allez créer un répertoir sur GitHub. "
		echo -e "A la première question prendre le second choix (local repository) et appuyer sur entrée jusqu'à la fin\n"
		
		echo -e ${CONTINUE_PHRASE} && read
		
		git_gh_repo_create

	fi
	
	prj_change ${PWD}
		
	echo -e ${CONTINUE_PHRASE} && read
}







function prj_rmv {

echo -ne "\e]0;Konsilion Hub - Projets suppressions\a"

# HEADER
	
	ksln_subheader "PROJETS" "SUPPRESSION"

# CORPS DE LA FONCTION

	ksln_continue_risk
	
	echo -e " Desactivation du projet ${PRJ_NAME} ...\n"
	
	cd ${PRJ_PATH_ORIGIN}
	
	echo -e " Suppression du projet ${PRJ_NAME} ... "

	rm -rf ${PRJ_PATH}

	echo -e "\n ${GREEN}terminée${NC}."

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
sed -i -e "s|${PRJ_PATH}|$d|g" ${PATH_PARAM}
echo -e ${LINE_DOUBLE}
echo -e " Redemarage nécessaire ... ${GREEN}Appuyer sur entrée${NC} pour continuer" && read 
cd ${PATH_ORIGIN}/server/etc && bash konnect.sh

}


function prj_jb_create {



echo -ne "\e]0;Konsilion Hub - Documentation scientifique création\a"

# HEADER
	
	ksln_subheader " DOCUMENTATION SCIENTIFIQUE > " "CRÉATION"

# CORPS DE LA FONCTION
	
	local path_create=${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/JupyterBook
	
	if [[ -d "$path_create" ]]; then
		echo -e "\n\n${GREEN}  [i]${NC} La documentation scientifique JupyterBook existe déjà. ${GREEN}Entrer${NC} pour continuer." && read
	
		prj_home
	fi
	

	mkdir ${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/JupyterBook
	
	cp -r ${PATH_ORIGIN}/server/lib/templates/JupyterBook/* ${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/JupyterBook

	echo -e ${LINE_DOUBLE}
	
	echo -e "\n  Documentation scientifique créée.\n"
	
	echo -e ${CONTINUE_PHRASE} && read

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
		
	echo -e ${LINE_DOUBLE}
	
	echo -e "\n  Documentation créée.\n"
	
	echo -e ${CONTINUE_PHRASE} && read
	
	# apps_mkdocs_serve
}



