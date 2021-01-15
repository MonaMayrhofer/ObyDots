xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto

if [ -d "$HOME/.obydots/profiles/$(hostname)" ]; then
	source "$HOME/.obydots/profiles/$(hostname)/.xsession"
fi

exec i3 --shmlog-size=26214400
