#!/bin/sh

systemd-cat -t "OBY .xsession" echo "Starting Obydots .xsession"

xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

PROFILE_DIR="$HOME/.obydots/profiles/$(hostname)"
systemd-cat -t "OBY .xsession" echo "Looking for profile directory '${PROFILE_DIR}'."

if [ -d "$PROFILE_DIR" ]; then
	systemd-cat -t "OBY .xsession" echo "Sourcing '${PROFILE_DIR}': ${PROFILE_DIR}/.xsession"
	. "${PROFILE_DIR}/.xsession"
fi

systemd-cat -t "OBY .xsession" echo "Time for i3. LETS GOOOO"
exec i3 --shmlog-size=26214400
