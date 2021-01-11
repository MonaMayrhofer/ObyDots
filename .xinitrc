#!/usr/bin/env bash

echo "$HOME/.obydots/profiles/$(hostname)" >> /home/obyoxar/XINITRC_DEBUG_LOG

if [ -d "$HOME/.obydots/profiles/$(hostname)" ]; then
	source "$HOME/.obydots/profiles/$(hostname)/.xinitrc"
fi

echo ".xinitrc finished at $(date)" > /home/obyoxar/XINITRC_DEBUG_LOG
