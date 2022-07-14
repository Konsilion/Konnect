#!/bin/bash

#####################################################################################################################
#
#	        FONCTIONS TRANSVERSES DE KONNECT
#
#####################################################################################################################


#################################################
#                                               #
#         VOS PARAMETRES - modifiables          #
#                                               #
#################################################


PRJ_PATH_ORIGIN="/home/nicolasbremond/Bureau/Konnect/server/lib/projects"



#################################################
#                                               #
#             FONCTIONS PRINCIPALES             #
#                                               #
#################################################





function klsn_home_example {


# A MODIFIER - Paramètres de votre page home

	local page_name="PAGE_NAME"
	local page_color=${BLUE}
	local page_bck_color=${BCK_CYAN}
	local page_master="konnect"
	
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
	
	ksln_header "" ${page_name} ${page_bck_color} 
	
	
		
# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color}
	
	
	
# A MODIFIER - LISTE DE ACTIONS NIVEAU PROJET
	
	echo -e "\n  Afin de vous guider dans la création de vos propres pages Konnect."
	
	echo -e "\n  Voici un petit explicatif :"
	
	echo -e "\n  Une page principale (home) regroupe vos propositions de fonctionnalité."
	
	echo -e "\n  Votre texte contenant vos propositions sont à indiquer ici."
	
	echo -e "\n  Ecrivez à la ligne pour une autre proposition."
	
	echo -e "\n  Afin de mettre un terme en ${GREEN}couleur${NC} vous pouvez faire comme ${RED}pour ici${NC}."
	
	echo -e "\n  Pour mettre des tabulation faite ceci \t et nous voilà tabulé \t\t et doublement ..."
	
	echo -e "\n  Soyer simple dans vos propositions, trop d'informations peut vous déservir."
	
	echo -e "\n  Taper 1. pour afficher le modèle des fonctions. k00 pour retour à l'acceuil."
	
	
	


# A MODIFIER - LIER CHIFFRE ET FONCTIONS

	list_choice=("" "prj_home" "git_home" "")
	
	local nbr_action=2 
	
	
	
# NE PAS MODIFIER - TRAITER L'ACTION

	echo -e "\n\n${LINE_SIMPLE}"
		     
	ksln_answer ${page_color} && read CHOICE && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} ${nbr_action} ${page_master} && ${list_choice[$CHOICE]}

	${page_master}
}





function ksln_function_example {


# A MODIFIER - Paramètres de votre fonction

	local fct_process="Docker"
	local fct_name="Ajout / Suppression"
	local page_master="konnect"



# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL

	echo -ne "\e]0;${HUB_NAME} - ${fct_name}\a"
	ksln_subheader ${fct_process} ${fct_name}



# A MODIFIER - CORPS DE VOTRE FONCTION
	
	echo -e "\n  Par rapport à une page home, une fonction est plus au cas par cas."
	
	echo -e "\n  Ainsi il est important de commenter vos fonctions et de penser simplement."
	
	echo -e "\n  Penser à SECURISER vos fonctions afin de limiter leur perimètre d'action à Konnect."
	
	echo -e "\n  Si votre fonction, supprime, modifie des fichiers existants, pensez à demander une confirmation."
	
	echo -e "\n  Pensez à partager vos fonctions"
	


# NE PAS MODIFIER - PRESS TO CONTINUE

	echo -e ${CONTINUE_PHRASE} && read
}





function ksln_bash_open {


	echo -e "  $(ksln_local_ln /home/ "Ouvrir nouveau terminal")"


}







function ksln_bash_konnect {

	cd ${PATH_ORIGIN}/server/etc/
	clear
	bash konnect.sh
}


function ksln_status {

	line_project="${BLACK}${BCK_WHITE}  ${1}  ${PURPLE}   ${3}  ${NC}"

	echo -e "${LINE_KONSILION} ${1}${BLACK}${BCK_GREEN}   ${2}   ${NC}\n\n"
}


function ksln_line_dot {

	echo -e "${LINE_DOTTED}\n"
}













function ksln_choice {

	if [[ -z "${1}" || ${1} -gt ${2} || ${1} -eq 0 ]]; then

		echo -e " ${GREEN}[i]  Entrée${NC} pour rafraichir la page" 

		read && ${3}
	fi
}


function ksln_answer {

case ${1} in

	GREEN)
	ANSWER_PHRASE="${GREEN}  Quel est votre choix (n°)\n_______________________________________________________________________________________________________________${BLACK}${BCK_GREEN} Réponse ${NC}\n"
		;;

     	YELLOW)
	ANSWER_PHRASE="${YELLOW}  Quel est votre choix (n°)\n_______________________________________________________________________________________________________________${BLACK}${BCK_YELLOW} Réponse ${NC}\n"
		;;

     	CYAN)
	ANSWER_PHRASE="${CYAN}  Quel est votre choix (n°)\n_______________________________________________________________________________________________________________${BLACK}${BCK_CYAN} Réponse ${NC}\n"
		;;

     	PURPLE)
	ANSWER_PHRASE="${PURPLE}  Quel est votre choix (n°)\n_______________________________________________________________________________________________________________${BLACK}${BCK_PURPLE} Réponse ${NC}\n"
		;;
     	*)
	ANSWER_PHRASE="${GREEN}  Quel est votre choix (n°)\n_______________________________________________________________________________________________________________${BLACK}${BCK_GREEN} Réponse ${NC}\n"
		;;
esac

echo -e "\n${ANSWER_PHRASE}"

ksln_shortcuts
}











function ksln_csv {

INPUT=${1}
OLDIFS=$IFS
IFS=','
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }
while read status reponame url
do
	echo -e "  - ${GREEN}$status${NC} - ${WHITE}$reponame${NC} : ${DIM}$url${NC}\n"

done < $INPUT
IFS=$OLDIFS
}









function ksln_header {

     	LINE_KONSILION="${BLACK}${BCK_WHITE}   ${HUB_NAME}   ${NC}"
	echo -e "${LINE_KONSILION} ${1}${BLACK}${3}   ${2}   ${NC}\n"
}




function ksln_subheader {

	echo -e "  ${1} ${BLACK}${BCK_PURPLE}   ${2}   ${NC}"
}





function ksln_info_banner {

# ${1}=Couleur

	echo -e "  Projet : ${1}${PRJ_NAME}${NC}  |  Environnement : ${1}${CONDA_DEFAULT_ENV}${NC}"
	echo -e "${LINE_SIMPLE}\n"
}








function ksln_links {

inside_git_repo="$(git rev-parse --is-inside-work-tree 2>/dev/null)"

if [ "$inside_git_repo" ]; then

	echo -e "  $(ksln_local_ln ${PRJ_PATH} "Dossier local")  |  $(ksln_http_ln $(git config --get remote.origin.url) "Dépôt en ligne")\n\n"

else

	echo -e "  $(ksln_local_ln ${PRJ_PATH} "Dossier local")"

fi
}


function ksln_local_ln {

	echo -e "\e]8;;file://${1}\a${2}\e]8;;\a"
}


function ksln_http_ln {

	echo -e "\e]8;;${1}\a${2}\e]8;;\a"
}









function ksln_shortcuts {

	echo -e "${BLACK}${BCK_CYAN} k01 ${NC} - Projets      ${BLACK}${BCK_YELLOW} k02 ${NC} - Git"\
	"      ${BLACK}${BCK_PURPLE} k03 ${NC} - Applications      ${BLACK}${BCK_GREEN} k04 ${NC} - Conda"\
	"      ${BLACK}${BCK_CYAN} k05 ${NC} - Forge\n"
}


function ksln_page {

ksln_line_dot

	case ${1} in

		k-1)
	     		clear && ksln_bash_konnect
			;;
	     	k00)
			clear -x && konnect
			;;
	     	k01)
	     		clear -x && prj_home
			;;
	     	k03)
	     		clear -x && apps_home
			;;
		k04)
	     		clear -x && conda_home
			;;
		k02)
	     		clear -x && git_home
			;;
		k05)
	     		clear -x && frg_home
			;;
		cls)
	     		clear -x
			;;

	     	*)
			;;
	esac
}

