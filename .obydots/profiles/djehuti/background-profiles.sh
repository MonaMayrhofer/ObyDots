setroot-backgrounds() {
	setroot -z "${IMAGE_ROOT}/background.png" -z "${IMAGE_ROOT}/background.png" --blank-color "#1f212a"
}

setroot-blank() {
	setroot -sc "#1f212a" -sc "#1f212a" --blank-color "#1f212a"
}
