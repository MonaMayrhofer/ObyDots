#!/bin/sh

DEVICES=$(xsetwacom --list devices | sed 's/id.*$//')

while read device ; do
	systemd-cat -t "OD: wacom.sh" echo "Mapping ${device} to HEAD-1"
	xsetwacom --set "${device}" MapToOutput HEAD-1
done <<< "${DEVICES}"
