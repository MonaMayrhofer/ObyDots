#!/usr/bin/env bash
set -e

close-pb(){
	echo "Restarting Polybar"
	
	# The || clause is needed because trees
	killall polybar || echo "WEIRD HACK WTF WHY?"
	
	echo "Waiting for shutdown..."
	# Wait until the processes have been shut down
	while pgrep -x polybar >/dev/null; do sleep 1; done
}

start-pb() {
	polybar top
	echo "Polybar Exited."
}

WATCH=false

while [[ $# -gt 0 ]]; do
	case $1 in
		'-w'|'--watch')
			WATCH=true
			;;
		*)
			echo "Unknown parameter $1"
			;;
	esac
	shift;
done

if [[ "$WATCH" = "true" ]]
then
	close-pb
	start-pb &
	echo "Watching..."
	inotifywait -e close_write -m "$HOME/.config/polybar" |
	while read -r directory events filename; do
  		if [ "$filename" = "config" ]; then
			close-pb
			start-pb &
	  	fi
	done
else
	close-pb
	start-pb
fi
