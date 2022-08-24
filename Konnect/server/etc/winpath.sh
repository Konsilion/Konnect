#!/bin/bash

function _winpath {

	echo "$@" | sed -e 's|\\|/|g' -e 's|^\([A-Za-z]\)\:/\(.*\)|/mnt/\L\1\E/\2|'

}

function winpath {

	path="$(_winpath $1)"
	
	echo $path
} 


