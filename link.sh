#!/usr/bin/env bash

if [[ ${USER} = "root" ]]; then
	echo "NO! You are root!"
	exit
fi

SCRIPTDIR=$(readlink -f $(dirname $0))
HOMEDIR=$(readlink -f ~)
echo "${SCRIPTDIR} -> ${HOMEDIR}"

create-link() {
	create-link-named $1 $1
}

create-link-named() {
	SOURCEDIR="${SCRIPTDIR}/$1"
	DESTDIR="${HOMEDIR}/$2"
	echo "Create Link from ${SOURCEDIR} to ${DESTDIR}"

	if [[ -L ${DESTDIR} ]]; then
		rm ${DESTDIR} 
	fi
	ln -s ${SOURCEDIR} ${DESTDIR}
}

create-link .xsession
create-link .zshrc
create-link .ghci
create-link .profile
create-link-named .profile .zprofile
create-link .obydots
create-link-named thirdparty/zplug .zplug
create-link-named thirdparty/asdf .asdf
create-link-named .obydots/dracula/gtk .themes/dracula
create-link-named xournalpptoolbar.ini .config/xournalpp/toolbar.ini

for confdir in ${SCRIPTDIR}/.config/*
do
	path=".config/$(basename ${confdir})"
	create-link "$path" "$path"
done

echo "userChrome.css (firefox theme) is not yet automatically linked. Please symlink it to ~/.mozilla/firefox/[DEFAULT-FOLDER]/chrome/userChrome.css. Where the DEFAULT-FOLDER is your current folder. Get its location at about:support in firefox."

echo "GTK Settings:"
gsettings set org.gnome.desktop.interface gtk-theme "dracula"
gsettings set org.gnome.desktop.wm.preferences theme "dracula"
