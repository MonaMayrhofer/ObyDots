#!/usr/bin/env bash

set -o nounset                                  # Treat unset variables as an error
set -e

echo "I am $USER"

dosudo() {
	CMD=$@
	echo "Requesting sudo for '$CMD'"
	sudo $CMD
}

dosudo usermod -a -G video $USER

BACKLIGHT_PATH=/sys/class/backlight/intel_backlight
if [[ ! -d $BACKLIGHT_PATH ]]; then
	echo "Your backlight is not under '$BACKLIGHT_PATH'... Things will not work"
	exit
fi

dosudo chmod g+rw $BACKLIGHT_PATH/brightness
dosudo chgrp video $BACKLIGHT_PATH/brightness

