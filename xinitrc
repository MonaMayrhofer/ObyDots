# Contained in ObyDots
CUSTOMRC_PATH="$HOME/.xinitrc_custom"
if [ -e "${CUSTOMRC_PATH}" ]; then
  source "${CUSTOMRC_PATH}"
fi

xsetwacom --set "Wacom Intuos S 2 Pad pad" Button 1 Button +2
xsetwacom --set "Wacom Intuos S 2 Pad pad" Button 3 Button +1
xsetwacom --set "Wacom Intuos S 2 Pad pad" Button 8 Button +8
xsetwacom --set "Wacom Intuos S 2 Pad pad" Button 9 Button +3
