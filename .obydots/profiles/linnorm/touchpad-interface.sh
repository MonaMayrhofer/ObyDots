touchpad-off() {
	xinput disable $1
}

touchpad-on() {
	xinput enable $1
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
