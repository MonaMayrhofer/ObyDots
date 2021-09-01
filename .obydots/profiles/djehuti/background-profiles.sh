setroot-backgrounds() {
	setroot -z "${IMAGE_ROOT}/background.png" -z "${IMAGE_ROOT}/background.png" --blank-color "#191919"
}

setroot-blank() {
	setroot -sc "#191919" -sc "#191919" --blank-color "#191919"
}
