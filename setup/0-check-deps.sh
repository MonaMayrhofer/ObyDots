#!/usr/bin/env zsh

set -o nounset                                  # Treat unset variables as an error
set -e

echo "NOt working yet."
exit 1

checkdep(){
	NAME=$1
	PATH=$(which $NAME || echo "null")
	if [[ "$PATH" = "null" ]]; then
		echo "$NAME NOT found"
		return 1
	fi
	echo "$NAME found ($PATH)"
	return 0
}

function yes_or_no {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0  ;;  
            [Nn]*) echo "Aborted" ; return  1 ;;
        esac
    done
}

maybe() {
	CMD=$@
	yes_or_no "Execute $CMD?" && $CMD
}

checkdep cargo || { 
	echo "Cargo not found, please install manually. ('rustup.rs'))"
	exit 1
}
source "$HOME/.cargo/env"
checkdep starship || maybe cargo install starship
checkdep zsh || maybe apt install zsh
checkdep polybar || maybe apt install polybar
checkdep i3 || maybe apt install i3-gaps
checkdep picom || maybe apt install picom
