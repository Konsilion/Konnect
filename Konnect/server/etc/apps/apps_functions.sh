#!/bin/bash

function apps_home {

# A MODIFIER - Paramètres de votre page home

	local page_name="GESTION_APPLICATIONS"
	local page_color=${PURPLE}
	local page_bck_color=${BCK_PURPLE}
	local page_master="apps_home"
	
	
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL
	
	conda_env_verif
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color} 

# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color}


if [[ ${PRJ_NAME} = "apps" ]]; then	

	echo -e "  $(ksln_local_ln ${PRJ_PATH} "Dossier de vos applications Web")\n\n"

	echo -e "  ${DIM}Modifications en local${NC}\t${GREEN}1${NC}. Ouvrir\t${GREEN}2${NC}. Modifier\t${RED}3${NC}. Éteindre\n"

	echo -e "  ${DIM}Publication${NC}\t\t\t${GREEN}4${NC}. Publier en ligne\n"

else
	
# CORPS DE LA FONCTION
	
	echo -e "\n\n\n    ${GREEN}Information${NC} : Afin de développer vos applications web,\
 il faut activer le projet (apps) - Taper ${GREEN}5${NC}. Activer\n\n\n"	

fi	

	echo -e "\t\t\t\t\t\t\t\t\t\t\t\t     ${RED}6${NC}. Tout désactiver"
	
	echo -e "${LINE_SIMPLE}"

# CHOICE / READ / ACTION
	
	list_choice=("" "apps_mercury_run" "apps_jupyter_lab" "apps_mercury_down" \
		     "apps_mercury_publish" \
		     "apps_prj_activate" \
		     "apps_down")
	
	ksln_answer "PURPLE" && read CHOICE && cd ${PRJ_PATH} && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "11" "apps_home" && ${list_choice[$CHOICE]}

# REFRESH

	apps_home
}







function apps_prj_activate {

	prj_change ${PRJ_PATH_ORIGIN}/apps

}

















function apps_spyder {

	spyder -w `pwd` &
	
	echo -e "L'application spyder nécessite ${GREEN}quelques secondes (7)${NC}, veuillez patienter..."

	sleep 7

	echo -e "\n  ${CONTINUE_PHRASE}\n" && read 

}


function apps_mike_list {


echo -e "\n  ${PURPLE}Liste des versions${NC} de votre documentation : \n"

cd mkdocs && mike list && cd .. && echo -e ${LINE_DOUBLE}

echo -e "\n  ${CONTINUE_PHRASE}\n" && read

}










function apps_mike_delete {


echo -ne "\e]0;Konsilion Hub - Documentation\a"

# HEADER
	
	ksln_subheader "DOCUMENTATION " "SUPRESSION D'UNE VERSION"

echo -e "\n  ${PURPLE}Liste des versions${NC} de votre documentation : \n"

cd mkdocs && mike list && cd .. && echo -e ${LINE_DOUBLE}

echo -e "\n  Quelle ${GREEN}version${NC} souhaitez-vous ${RED}supprimer${NC} de votre documentation : \n"

read version_name

ksln_continue_risk

cd mkdocs

mike delete ${version_name} 


echo -e ${LINE_DOTTED}

echo -e "\n  Vérifiez la suppression de la version :"

mike list && cd ..

echo -e "\n  ${CONTINUE_PHRASE}\n" && read

}









function apps_mike_publish {


echo -ne "\e]0;Konsilion Hub - Documentation\a"

# HEADER
	
	ksln_subheader "DOCUMENTATION " "PUBLICATION"


echo -e "\n  ${PURPLE}Liste des versions${NC} de votre documentation : \n"

cd mkdocs && mike list && cd .. && echo -e ${LINE_DOUBLE}

# Choix du nom de version

echo -e "  Que ${PURPLE}souhaitez-vous${NC} faire ?\n"


PS3="---------------------------------------- >> Taper le numéro de votre choix :"
options=("Mettre à jour une version existante" "Créer une nouvelle version" "Annuler")
select opt in "${options[@]}"

do
    case $opt in
        "Mettre à jour une version existante")
            
            echo -e ${LINE_DOUBLE}
            
            echo -e "\n  Dans la liste ci-dessus, indiquez le nom d'une ${PURPLE}version existante${NC}:\n"
            
            read version_name
            
            break
            ;;
        "Créer une nouvelle version")
            
            echo -e ${LINE_DOUBLE}
            
            echo -e "\n  Indiquez un nom de ${PURPLE}version non-existant${NC} dans la liste ci-dessus :\n"
            
            read version_name
            
            break
            ;;
        "Annuler")
            prj_home
            
            break
            ;;
        *) 
	    echo "Option invalide $REPLY"
	    prj_home
	    
	    break
            ;;
    esac
done


echo -e ${LINE_DOUBLE}

echo -e "  ${PURPLE}Dernière question${NC}, que souhaitez-vous faire ?\n"

# Choix du type de publication

PS3="---------------------------------------- >> Taper le numéro de votre choix :"
options=("Publier en local" "En ligne" "Annuler")
select opt in "${options[@]}"

do
    case $opt in
        "Publier en local")
        
            cd mkdocs
        
	    mike deploy $version_name && cd ..    

            break
            ;;
        "En ligne")

            cd mkdocs && mike deploy $version_name && cd ..
	    
	    git_index_add
	    
	    git_index_commit
	    
	    git_repo_push
	    
	    git checkout gh-pages
	    
	    git_repo_push
	    	    
	    echo -e ${LINE_DOTTED}
	    
	    echo -e "\n  ${GREEN}Bravo${NC} ! Votre documentation et sa nouvelle version sont ${GREEN}en ligne${NC}."
	    
	    echo -e "\n  A l'adress suivante : \
	    https://${DIM}<votre nom github>${NC}.github.io/${DIM}<votre nom de projet>${NC}/${DIM}<nom de votre version>${NC}"
	    
	    echo -e "\n  ${RED}Important${NC}: changer de branche git par la suite. Taper Entrée > 2 > 4 > votre branche de travail"
	    
    	    echo -e ${LINE_DOTTED}
	    
	    echo -e "\n${CONTINUE_PHRASE}\n" && read

	    break
            ;;
        "Annuler")
            prj_home
            break
            ;;
        *) echo "Option invalide $REPLY";;
    esac
done











}





function apps_jb_publish {

	
	echo -ne "\e]0;Konsilion Hub - Documenation scientifique\a"

# HEADER
	
	ksln_subheader "DOCUMENTATION SCIENTIFIQUE" "PUBLICATION EN LIGNE"
	
	
	
	apps_jb_serve

	ghp-import -n -p -f ./JupyterBook/_build/html

}








function apps_jb_serve {



echo -ne "\e]0;Konsilion Hub - Documenation scientifique\a"

# HEADER
	
	ksln_subheader "DOCUMENTATION SCIENTIFIQUE" "CONSTRUCTION"
	
# CORPS DE LA FONCTION


	local path_doc=${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/JupyterBook
	
	if [[ ! -d "$path_doc" ]]; then
		echo -e "\n\n${GREEN}  [i]${NC} La documentation scientifique n'existe pas encore"\
		"${GREEN}  Entrer${NC} pour raffraichir la page."		&& read
	
		prj_home
	fi
	
	cd ${PRJ_PATH}
	
	jupyter-book build ./JupyterBook/

	echo -e "  $(ksln_local_ln ${PRJ_PATH}/JupyterBook/_build/html/index.html "Consulter votre documentation en local")"

	echo -e "\n  - Documentation créée\n\n${CONTINUE_PHRASE}"

}



function apps_jb_down {


echo -ne "\e]0;Konsilion Hub - Éteindre JupyterBook\a"

# HEADER
	
	ksln_subheader " Jupyter Book > " "ÉTEINDRE"

# CORPS DE LA FONCTION

	# Pas besoin de l'eteindre, car aucun processus en fond. Juste création de la doc.		
	
	echo -e "\n  - Instances Jupyter Book ${GREEN}éteinte.${NC}\n\n${CONTINUE_PHRASE}"
	
	read
}











function apps_mkdocs_serve {

echo -ne "\e]0;Konsilion Hub - Documenation\a"

# HEADER
	
	ksln_subheader "DOCUMENTATION" "LECTURE SIMPLE"
	
# CORPS DE LA FONCTION


	local path_doc=${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/mkdocs
	
	if [[ ! -d "$path_doc" ]]; then
		echo -e "\n\n${GREEN}  [i]${NC} La documentation n'existe pas encore"\
		"${GREEN}  Entrer${NC} pour raffraichir la page."		&& read
	
		prj_home
	fi
	
	cd ${PRJ_PATH}/mkdocs
	
	apps_mkdocs_down
	
	mkdocs serve &
	
	cd ..
}



function apps_mike_serve {

echo -ne "\e]0;Konsilion Hub - Documenation\a"

# HEADER
	
	ksln_subheader "DOCUMENTATION" "LECTURE"
	
# CORPS DE LA FONCTION


	local path_doc=${PATH_ORIGIN}/server/lib/projects/${PRJ_NAME}/mkdocs
	
	if [[ ! -d "$path_doc" ]]; then
		echo -e "\n\n${GREEN}  [i]${NC} La documentation n'existe pas encore"\
		"${GREEN}  Entrer${NC} pour raffraichir la page."		&& read
	
		prj_home
	fi
	
	cd ${PRJ_PATH}/mkdocs
	
	mike list
	
	echo -e "\n  ${GREEN}Quelle version${NC} ouvrir ? \n" 
	
	read version_name
	
	mike set-default ${version_name}
	
	mike serve --dev-addr 127.0.0.1:8000 > /dev/null 2>&1 &
}



function apps_mkdocs_ghdeploy {

	cd ${PRJ_PATH}/mkdocs

	mkdocs gh-deploy &
	
	echo -e "\n  ${CONTINUE_PHRASE}\n" && read 
}







	
function apps_jupyter_nb {

# HEADER	
	echo -ne "\e]0;Konsilion Hub - Jupyter Notebook\a"
	ksln_subheader "DOCUMENTATION" "MODIFICATION"
	
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

	ksln_subheader "DOCUMENTATION" "MODIFICATION"
	
# CORPS DE LA FONCTION
	
	cd ${PRJ_PATH}
	
	jupyter lab &
}
	






















function apps_mkdocs_down {

echo -ne "\e]0;Konsilion Hub - Éteindre documentation\a"

# CORPS DE LA FONCTION

	if ps aux | grep 'mike'| grep -v grep; then		
		if [ ${PID_IDX} == 1 ]; then
			kill $(ps aux | grep 'mike' | grep -v grep | awk '{print $1}')
		elif [ ${PID_IDX} == 2 ]; then
			kill $(ps aux | grep 'mike' | grep -v grep | awk '{print $2}')
		fi	
	fi
	
	if ps aux | grep 'mkdocs'| grep -v grep; then		
		if [ ${PID_IDX} == 1 ]; then
			kill $(ps aux | grep 'mkdocs' | grep -v grep | awk '{print $1}')
		elif [ ${PID_IDX} == 2 ]; then
			kill $(ps aux | grep 'mkdocs' | grep -v grep | awk '{print $2}')
		fi	
	fi	
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



function apps_mercury_watch {

echo -ne "\e]0;Konsilion Hub - Applications Web\a"

# HEADER
	
	jupyter lab

}




function apps_mercury_run {


	apps_mercury_down


echo -ne "\e]0;Konsilion Hub - Applications Web\a"
	
	cd ${PRJ_PATH}
	
	mercury run 127.0.0.1:8005 &
	
	cd ${PRJ_PATH}
}


function apps_mercury_publish {

	    git_index_add
	    
	    git_index_commit
	    
	    git_repo_push

heroku config:set SERVE_STATIC=True
heroku config:set ALLOWED_HOSTS=konsilion.herokuapp.com
heroku config:set NOTEBOOKS=*.ipynb
heroku config:set WELCOME=welcome.md

git push heroku master
}





function apps_mercury_down {

echo -ne "\e]0;Konsilion Hub - Éteindre mercury\a"

# HEADER
	
	ksln_subheader "WEB APP > " "ÉTEINDRE"

# CORPS DE LA FONCTION

	if ps aux | grep 'mercury'| grep -v grep; then		
		if [ ${PID_IDX} == 1 ]; then
			kill $(ps aux | grep 'mercury' | grep -v grep | awk '{print $1}')
		elif [ ${PID_IDX} == 2 ]; then
			kill $(ps aux | grep 'mercury' | grep -v grep | awk '{print $2}')
		fi	
	fi
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
