#!/bin/bash 
ESC="\033["
CRED="${ESC}0;31m"
CGRN="${ESC}0;32m"
CLRED="${ESC}1;31m"
CNONE="${ESC}0m"

scriptdir=$(dirname $(readlink -f $0))
echo -e "${CLRED}=== DotDirLinker ===${CNONE}"
echo -e "Executing Link from ${CGRN}$scriptdir${CNONE}"
cd $scriptdir
echo -e "Currently in ${CGRN}$(pwd)${CNONE}"
echo -e "User: ${CGRN}$(whoami) ($(id -u))${CNONE}"
home=$HOME
echo -e "Home: ${CGRN}$home${CNONE}"

backupdatestr=$(date +%d_%m_%y_%H%M)

bckupdir=$scriptdir/backup/$backupdatestr

crtolink(){
  from=$scriptdir/$1
  to=$home/$2
  echo "$from -> $to"
  if [ -e $to ] || [ -L $to ]; then
    bckuptrg=$bckupdir
    echo -e "${GRED}$to${CNONE} exists. Moving to $bckuptrg"

    if [ ! -d $bckuptrg ]; then mkdir -p $bckuptrg; fi
    mv $to $bckuptrg
  fi
  ln -s $from $to
}

crtolink ozsh .ozsh
crtolink zshrc .zshrc
crtolink xinitrc .xinitrc
crtolink p10k.zsh .p10k.zsh
crtolink tmux.conf .tmux.conf
crtolink oasdf/asdf .asdf
crtolink vifmrc .config/vifm/vifmrc
crtolink oranger .config/ranger

crtolink otmux .otmux
