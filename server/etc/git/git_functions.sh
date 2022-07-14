#!/bin/bash


# COMMENTAIRE : =============

# Toutes les fonctions disponibles pour votre Hub. La fonction principale (git_home) vous permet de sélectionner celles qui vous correspond.

# N'oubliez pas que vous pouvez à tous moment ouvrir un terminal brut, afin de renseigner une commande spécifique.

#=============================


function git_home {

# A MODIFIER - Paramètres de votre page home

	local page_name="VERSIONNING_PROJET"
	local page_color=${YELLOW}
	local page_bck_color=${BCK_YELLOW}
	local page_master="git_home"


# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL

	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"

	ksln_header "" ${page_name} ${page_bck_color} 

if [[ ${PRJ_LOAD} = 1 ]]; then

local inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ "$inside_git_repo" ]; then

	# NE PAS MODIFIER - INFORMATIONS A AFFICHER

	ksln_info_banner ${page_color}

	# CORPS DE LA FONCTION

	ksln_links

	echo -e "\n  - ${WHITE}Github${NC}\t\t\t\t${GREEN}1${NC}. Créer repertoire\t${GREEN}2${NC}. Informations\n\n"

	echo -e "\n  - ${WHITE}Branche de travail${NC}${NC}\t\t\t${GREEN}3${NC}. Lister\t${GREEN}4${NC}. Changer\t${GREEN}5${NC}. Créer\t${RED}6${NC}. Retirer (${YELLOW}$(git branch | grep "*")${NC})\n"

	echo -e "  - ${WHITE}Vos modifications${NC}\t\t\t${GREEN}7${NC}. Afficher\t${GREEN}8${NC}. Ajouter\t${GREEN}9${NC}. Finaliser\t${DIM}10. Retirer${NC}\n"

	echo -e "  - ${WHITE}Envoyer vos modifications${NC}\t\t${DIM}11. Vérifier${NC}\t${GREEN}12${NC}. Envoyer\t${GREEN}13${NC}. Archives\n\n"

	echo -e "\n\n\t\t\t\t\t\t\t      ${GREEN}14${NC}. Paramètres   |  ${GREEN}15${NC}. Sortir du projet  |  ${RED}16${NC}. Dé-giter"

	echo -e ${LINE_SIMPLE}

	# RACCOURCI

else

	echo -e "  Dépôt projet : ${YELLOW}${PRJ_NAME}${NC}      |      Environnement : ${YELLOW}${CONDA_DEFAULT_ENV}${NC}"
	echo -e "${LINE_SIMPLE}\n\n"

	echo -e "\n  ${GREEN}19${NC}. Initialiser votre dossier avec Git : $(ksln_local_ln ${PRJ_PATH} "Dossier local")\n"	

	echo -e ${LINE_DOUBLE}

fi


else
	# RACCOURCI

	echo -e "  ${GREEN}17${NC}. Ouvrir un projet	  ${GREEN}18${NC}. Télécharger un projet"
	echo -e "${LINE_SIMPLE}\n"
	
	# INFORMATIONS
	prj_list
	
	echo ""
fi

# QUESTION / CHOIX / ACTION
		 
	list_choice=("" "git_gh_repo_create" "git_gh_repo_view" \
		     "git_list" "git_branch_activate" "git_branch_add" "git_branch_rmv" \
		     "git_index_list" "git_index_add" "git_index_commit" "" \
		     "" "git_repo_push" "git_archive_list" \
		     "git_info" "prj_deactivate" "git_deinit"\
		     "prj_activate" "git_clone" \
		     "git_init")
		     
	ksln_answer "YELLOW" && read CHOICE && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "19" "git_home" && ${list_choice[$CHOICE]}

# REFRESH

	git_home


}


function git_gh_repo_rmv {

	gh repo delete 
	
}


function git_gh_repo_list {


	# HEADER
	echo -ne "\e]0;Konsilion Hub - Vos répertoires Git\a"
	ksln_subheader " ${GREEN}INFORMATIONS${NC} - GIT " "LISTE DES REPERTOIRES"

	gh repo list 
	
}





function git_gh_repo_create {

	gh repo create
	
	gh repo view

}


function git_gh_repo_view {

	# HEADER	
	echo -ne "\e]0;Konsilion Hub - Vos informations utilisateurs\a"
	ksln_subheader " ${GREEN}INFORMATIONS${NC} - GIT " "LISTE DES REPERTOIRES"

	gh repo view
	
	echo -e "\n${CONTINUE_PHRASE}" && read
	
	git_gh_repo_list
	
	echo -e "\n${CONTINUE_PHRASE}" && read		

}


function git_clone {


	echo -e "\n\n ${GREEN}[i]${NC} Copier ici le lien du projet ( https: ... .git ) :\n"

	read remote_http

	git clone $remote_http 

}





function git_archive_list {

	git log

	echo -e "\n${CONTINUE_PHRASE}" && read


}







function git_branch_activate {

	ksln_subheader "${PRJ_NAME} > " "CHANGER - BRANCHE"

	echo ""

	git branch

	echo -e "\n  Indiquer le nom de votre ${PURPLE}nouvelle branche${NC} :\n"
	
	read branch_name

	git checkout ${branch_name}

	echo -e "\n  Vérifier sa création\n"
	
	git branch
	
	echo -e "\n${CONTINUE_PHRASE}" && read		

}

function git_branch_add {


	ksln_subheader "${PRJ_NAME} > " "AJOUTER - BRANCHE"
	
	echo ""
	
	git branch
	
	echo -e "\n  Indiquer le nom de votre ${PURPLE}nouvelle branche${NC} :\n"
	
	read branch_name
	
	git branch ${branch_name}
	
	git checkout ${branch_name}

	echo -e "\n  Vérifier sa création\n"
	
	git branch
	
	echo -e "\n${CONTINUE_PHRASE}" && read		

	

}

function git_branch_rmv {


	ksln_subheader "${PRJ_NAME} > " "SUPPRIMER - BRANCHE"
	
	echo ""
	
	git branch
	
	echo -e "\n  Indiquer le nom de la ${PURPLE}branche à supprimer${NC} :\n"
	
	read branch_name
	
	git branch ${branch_name}
	
	git branch -d ${branch_name}

	echo -e "\n  Vérifier sa supression : \n"
	
	git branch
	
	echo -e "\n${CONTINUE_PHRASE}" && read		

}
























function git_index_commit {

	git commit

}




function git_repo_push {

	# ACTION DANGEREUSE
	
	# git diff --stat --cached origin/master
	
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
	
	git push origin $branch
}










function git_info {

	ksln_subheader "${PRJ_NAME} > " "STATUS GIT | GITHUB"
	
	echo -e "\n ${BLUE}GIT --${NC}\n"

	git config --global user.name && git config --global user.email
	
	echo -e "\n ${BLUE}GITHUB --${NC}\n"
	
	gh auth status
	
	echo -e ${CONTINUE_PHRASE} && read
}




function git_list {

	ksln_subheader "${PRJ_NAME} > " "BRANCHES GIT"

	echo -e "\n  Liste des branches du projet : ${BLUE}${PRJ_NAME}${NC}\n"
	
	git branch
	
	echo -e "\n${CONTINUE_PHRASE}" && read	
}









function git_index_list {

	ksln_subheader "${PRJ_NAME} > " "SALLE D'ATTENTE (local)"

	echo -e "\n  Liste des taches pour le prochain envoie - commit : ${BLUE}${PRJ_NAME}${NC}\n"
	
	git status
	
	echo -e "\n${CONTINUE_PHRASE}" && read		



}


function git_index_rmv {

	ksln_subheader "${PRJ_NAME} > " "RETIRER - SALLE D'ATTENTE (local)"
	
	echo ""
	
	git status
	
	echo -e "\n  Indiquer le chemin du fichier (faite glisser) :"
	
	read $d
	
	git restore --staged $d

	echo -e "\n  Vérifier votre suppression - commit : ${BLUE}${PRJ_NAME}${NC}\n"
	
	git status
	
	echo -e "\n${CONTINUE_PHRASE}" && read		
}



function git_repo_fetch {

	echo ""

}






function git_init {

	ksln_subheader "${PRJ_NAME} > " "INITIALISATION GIT"
	
	git init
	
	# gh repo create
		
	echo -e ${LINE_DOUBLE}
	
	ksln_subheader " $WINDOWS - {RED}MANUEL D'UTILISATION${NC} - " "GIT INIT EDITION"
	
	echo -e " 
	• Vous allez être redirigez vers un editeur de texte dont il faut connaitres trois commandes :\n\n
	• ${GREEN}INSERER{NC} : Appuyez sur ${GREEN}i{NC}\n
	• ${GREEN}QUITTER MODE INSERTION{NC} : Appuyez sur ${GREEN}esc{NC}\n
	• ${GREEN}QUITTER + SAUVEGARDER{NC} : Appuyez sur ${GREEN}:q!{NC}\n" 
	
	read
	
	git_index_add
	
	echo -e ${LINE_DOUBLE}

	git_index_commit 

	git_info
	
}




function git_deinit {

	rm -rf ${PRJ_PATH}/.git

}





function git_index_add {

	ksln_subheader "${PRJ_NAME} > " "AJOUT - SALLE D'ATTENTE (local)"
	
	git add *
	
	git add .gitignore

	echo -e "\n  Vérifier votre ajout - commit : ${BLUE}${PRJ_NAME}${NC}\n"
	
	git status
	
	echo -e "\n${CONTINUE_PHRASE}" && read		
}
