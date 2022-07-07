#!/bin/bash

function frg_home {

# A MODIFIER - Paramètres de votre page home

	local page_name="Forge"
	local page_color=${BLUE}
	local page_bck_color=${BCK_CYAN}
	local page_master="frg_home"
	
		
# NE PAS MODIFIER - EN TÊTE et DESIGN GENERAL
	
	clear -x && echo -ne "\e]0;${HUB_NAME} - ${page_name}\a"
		
	ksln_header "" ${page_name} ${page_bck_color} 
		

# NE PAS MODIFIER - INFORMATIONS A AFFICHER
	
	ksln_info_banner ${page_color}

	
# A MODIFIER - CORPS DE LA FONCTION
	
	echo -e "\n  ${GREEN}1${NC}. Télécharger un projet\t\t${GREEN}2${NC}. Changer de forge\t\t${GREEN}3${NC}. Lister les forges"
	
	echo -e "${LINE_SIMPLE}\n"

	echo -e "  ${BLUE}Status${NC} - ${WHITE}Name${NC} : Repo URL"
	
	echo -e "${LINE_SIMPLE}\n\n\n  Liste des projets renseignés dans le $(ksln_local_ln ${FORGE_PATH} "Registre") : $(basename "${FORGE_PATH}")\n\n"

	ksln_csv ${FORGE_PATH}
	
	echo -e "\n\n${LINE_SIMPLE}"
			
# ANSWER 	
		
	list_choice=("" "frg_download" "frg_activate" "frg_list")
	
	ksln_answer "CYAN" && read CHOICE && ksln_page ${CHOICE}
	
	ksln_choice ${CHOICE} "3" "frg_home" && ${list_choice[$CHOICE]}
	
	frg_home

}



function frg_download {

# HEADER	
	echo -ne "\e]0;Konsilion Hub - Téléchargement depuis la forge\a"
	ksln_subheader " ${GREEN}INFORMATIONS${NC} - PROJET FORGE" "TELECHARGEMENT"
	
# CORPS DE LA FONCTION
	
	git_clone
}


function frg_list {
  
	search_dir=${PATH_ORIGIN}/server/lib/forge

	echo -e "  Toutes vos forges enregistrées ($(ksln_http_ln "https://konsilion.fr/wp/recherche-et-developpement/forge/" "Accéder à plus de forge")) :\n"

	array=()
	tempi=1
	for file in "$search_dir"/*; do
		echo -e "  - $(basename "$file")"
	done

	echo -e ${LINE_SIMPLE}
	
	echo -e "\n${CONTINUE_PHRASE}" && read
}


function frg_activate {
 
# HEADER
	
	echo -ne "\e]0;Konsilion Hub - Forge ouverture\a"
	echo -e "$(ksln_subheader " FORGE > " "ACTIVATION")\n"
	
# INFORMATIONS - Copier de list prj_num

	search_dir=${PATH_ORIGIN}/server/lib/forge
    
	echo -e "Toutes les forges :\n"

	array=()
	tempi=0
	#array[$tempi]=${PRJ_PATH}
	for file in "$search_dir"/*; do
		((tempi+=1))
		echo -e "$tempi . $(basename "$file")"
		array[$tempi]=$file
	done
	
	echo -e ${LINE_DOUBLE}
	
# CORPS DE LA FONCTION

	echo -e "  • ${GREEN}Numéro de la forge à activer ${NC}?\n"
	
	read  forge_num 
	
	if [[ -z "$forge_num" || $forge_num -gt $tempi || $forge_num -eq 0 ]]; then
		
		echo -e " ${GREEN}[i]${NC} Aucune séléction ... ${GREEN}continuer${NC} " && read
		frg_home
		
	fi
	
	frg_change ${array[${forge_num}]}

	echo -e ${LINE_DOUBLE}
}


function frg_change {

d=$1
sed -i -e "s|${FORGE_PATH}|$d|g" ${PATH_ENV}
echo " Redemarage nécessaire ..."
cd ${PATH_ORIGIN}/server/etc && bash konnect.sh

}
