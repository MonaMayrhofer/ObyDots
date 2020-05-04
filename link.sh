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
  move=false
  from=$scriptdir/$1
  to=$home/$2
  printf "${CLRED}[$from -> $to]${CNONE} "
  if [ -L $to ]; then
    dest=$(readlink -f $to)
    printf "${CRED}$to${CNONE} exists as a link to ${GRED}$dest${CNONE}." 
    if [ "$dest" = "$(readlink -f $from)" ]; then
      printf " This is fine. Will be unchanged."
      printf "\n"
      return
    else
      move=true
    fi
  fi
  if [ -f $to ] && [ ! -L $to ]; then
    printf "${CRED}$to${CNONE} exists."
    move=true
  fi

  if [ "$move" = "true" ]; then
    bckuptrg=$bckupdir
    printf "Moving to $bckuptrg"

    if [ ! -d $bckuptrg ]; then mkdir -p $bckuptrg; fi
    mv $to $bckuptrg
  fi
  ln -s $from $to
  printf "\n" 
}

mkcustomrc(){
  original=$home/$1
  new=$home/$1_custom
  if [ -f $original ] && [ ! -L $original ]; then
    echo -e "${CRED}$original${CNONE} exists. Moving to $new. This new file is executed in $original"
    mv $original $new
  fi
}

crtolink ozsh .ozsh
mkcustomrc .zshrc
crtolink zshrc .zshrc
mkcustomrc .xinitrc
crtolink xinitrc .xinitrc
crtolink p10k.zsh .p10k.zsh
crtolink tmux.conf .tmux.conf
crtolink oasdf/asdf .asdf
crtolink vifmrc .config/vifm/vifmrc
crtolink oranger .config/ranger
crtolink oalacritty .config/alacritty

crtolink otmux .otmux
