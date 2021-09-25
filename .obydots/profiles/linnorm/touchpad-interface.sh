touchpad-off() {
	xinput disable $1
	notify-send -h string:synchronous:true -u low -a "Touchpad" "disabled"
}

touchpad-on() {
	xinput enable $1
	notify-send -h string:synchronous:true -u low -a "Touchpad" "enabled"
}

touchpad-toggle() {
	ID=$(xinput list --id-only "ELAN0412:00 04F3:316F Touchpad")	
	ENABLED=$(xinput list-props "${ID}" | grep "Device Enabled" | awk '{print $4}')
	
	if [[ "$ENABLED" -eq 1 ]]; then
		touchpad-off "$ID"
	else
		touchpad-on "$ID"
	fi
}
