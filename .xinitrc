#!/usr/bin/env bash

if [ -d "$HOME/.obydots/profiles/$(hostname)" ]; then
	source "$HOME/.obydots/profiles/$(hostname)/.xinitrc"
fi
