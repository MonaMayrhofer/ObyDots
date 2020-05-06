#!/bin/bash 
ESC="\033["
CRED="${ESC}0;31m"
CGRN="${ESC}0;32m"
CLRED="${ESC}1;31m"
CUWHT="${ESC}4;37m"
CBOLD="${ESC}1m"
CNONE="${ESC}0m"

scriptdir=$(dirname $(readlink -f $0))
echo -e "${CLRED}=== DotDirLinker ===${CNONE}"
echo -e "Executing Link from ${CGRN}$scriptdir${CNONE}"
cd $scriptdir
echo -e "Currently in ${CGRN}$(pwd)${CNONE}"
echo -e "User: ${CGRN}$(whoami) ($(id -u))${CNONE}"
home=$HOME
echo -e "Home: ${CGRN}$home${CNONE}"
obydotrcgenpath="${HOME}/.obydotrc_generated"
echo -e "ObyDotRc_Generated: ${CGRN}${obydotrcgenpath}${CNONE}"


backupdatestr=$(date +%d_%m_%y_%H%M)

bckupdir=$scriptdir/backup/$backupdatestr

printf "Files that are moved to ${CUWHT}backup${CNONE} will be moved to ${CGRN}${bckupdir}${CNONE}\n"

crtolink(){
  move=false
  link=true
  from=$scriptdir/$1
  to=$home/$2
  
  prn_file=""
  prn_status=""
  prn_action=""

  prn_file="[$from -> $to]"
  prn_line_color="${CGRN}"

  if [ -L $to ]; then
    dest=$(readlink -f $to)
    # prn_status="${CUWHT}$to${CNONE} exists as a link to ${GUWHT}$dest${CNONE}." 
    if [ "$dest" = "$(readlink -f $from)" ]; then
      # prn_action=" This is fine. Will be unchanged."
      prn_status="${CGRN}✓${CNONE} Link Exists${CNONE}"
      link=false
    else
      move=true
    fi
  else
    if [ -f $to ] && [ ! -L $to ]; then
      prn_status="${CUWHT}$to${CNONE} exists (file)."
      move=true
    elif [ -d $to ]; then
      prn_status="${CUWHT}$to${CNONE} exists (directory)."
      move=true
    else
      prn_status="${CUWHT}$to${CNONE} does not exist."
    fi
  fi


  success="true"
  if [ "$move" = "true" ]; then
    bckuptrg=$bckupdir
    prn_action="${prn_action} Moving to backup."
    prn_line_color="${CRED}"

    if [ ! -d $bckuptrg ]; then mkdir -p $bckuptrg; fi
    mv $to $bckuptrg || success="false"
  fi
  if [ "$link" = "true" ]; then
    ln -s $from $to || success="false"
    prn_line_color="${CNONE}"
    prn_action="${prn_action} Creating link."
  fi

  if [ "$success" = "true" ]; then
    success="${CBOLD}${CGRN}[✔]${CNONE}"
  else
    success="${CBOLD}${CRED}[✘]${CNONE}"
  fi
  printf "${success}${prn_line_color}${CBOLD}${prn_file}${CNONE}: ${prn_status}${prn_action}\n" 
}

mkcustomrc(){
  original=$home/$1
  new=$home/$1_custom
  if [ -f $original ] && [ ! -L $original ]; then
    echo -e "${CRED}$original${CNONE} exists. Moving to $new. This new file is executed in $original"
    mv $original $new
  fi
}

checkex() {
  command=$1
  message=$2
  if [ ! $(which $command) ]; then
    printf "[$> ${CBOLD}$command${CNONE}] doesn't exist. $message\n"
  fi
}

printf "\n${CNONE}==========${CNONE}\n\n"
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

checkex fzf "Please install Fuzzyfinder 'sudo apt install fzf'"

printf "\n${CNONE}==========${CNONE}\n"
printf "Setting Dconf Gnome Keybinds\n\n"
source ./dconf_write_gnome.sh

printf "\n${CNONE}==========${CNONE}\n"
printf "Generating RC-File in ${CUWHT}${obydotrcgenpath}${CNONE}\n"
if [ -f ${obydotrcgenpath} ]; then
  printf "Deleting old RC-File\n"
  rm ${obydotrcgenpath}
fi
echo "OBYDOTBINDIR='${scriptdir}/obin'" >> ${obydotrcgenpath}

cat ${obydotrcgenpath}
