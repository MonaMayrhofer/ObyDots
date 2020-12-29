#!/usr/bin/env bash
set -e

VERSION="2.1.0"

NERD_FONT_LINK="https://github.com/ryanoasis/nerd-fonts/releases/download/v${VERSION}/JetBrainsMono.zip"
NERD_FONT_DIR=$HOME/.cache/obydots
NERD_FONT_FILE=JetBrainsMonoNerd${VERSION}.zip
NERD_FONT_PATH="$NERD_FONT_DIR/$NERD_FONT_FILE"

mkdir -p $NERD_FONT_DIR

if [[ ! -f $NERD_FONT_PATH ]]; then
	wget $NERD_FONT_LINK -O $NERD_FONT_PATH
else
	echo "Using cached Font at ${NERD_FONT_PATH}"
fi

unzip $NERD_FONT_PATH -d ~/.local/share/fonts/jetbrainsmononerdfont

