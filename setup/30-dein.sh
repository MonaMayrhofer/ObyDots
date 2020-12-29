#!/usr/bin/env bash

mkdir -p $HOME/.cache/obydots
INSTALLER_PATH=$HOME/.cache/obydots/dein-installer.sh
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > $INSTALLER_PATH

source $INSTALLER_PATH ~/.cache/dein
