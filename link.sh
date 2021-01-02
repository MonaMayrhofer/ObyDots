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
create-link .xinitrc
create-link .zshrc
create-link .profile
create-link .obydots
create-link-named thirdparty/zplug .zplug
create-link-named thirdparty/asdf .asdf

for confdir in ${SCRIPTDIR}/.config/*
do
	create-link ".config/$(basename ${confdir})"
done
