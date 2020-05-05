#!/usr/bin/env bash

left="h"
down="j"
up="k"
right="l"

KEYS_GNOME_WM=/org/gnome/desktop/wm/keybindings
KEYS_GNOME_SHELL=/org/gnome/shell/keybindings
KEYS_MUTTER=/org/gnome/mutter/keybindings
KEYS_MEDIA=/org/gnome/settings-daemon/plugins/media-keys

# Disable incompatible shortcuts
# Restore the keyboard shortcuts: disable <Super>Escape
dconf write /org/gnome/mutter/wayland/keybindings/restore-shortcuts "@as []"
# Hide window: disable <Super>h
dconf write ${KEYS_GNOME_WM}/minimize "@as ['<Super>comma']"
dconf write ${KEYS_GNOME_WM}/maximize "@as []"
dconf write ${KEYS_GNOME_WM}/unmaximize "@as []"
dconf write ${KEYS_GNOME_SHELL}/toggle-message-tray "@as []"
# Open the application menu: disable <Super>m
dconf write ${KEYS_GNOME_SHELL}/open-application-menu "@as []"
# Switch to workspace left: disable <Super>Left
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-left "@as []"
# Switch to workspace right: disable <Super>Right
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-right "@as []"

# Super + direction keys, move window left and right monitors, or up and down workspaces
# Move window one monitor to the left
dconf write ${KEYS_GNOME_WM}/move-to-monitor-left "['<Shift><Super>Left','<Shift><Super>${left}']"
# Move window one workspace down
dconf write ${KEYS_GNOME_WM}/move-to-workspace-down "['<Shift><Super>Page_Down','<Shift><Super>${down}']"
# Move window one workspace up
dconf write ${KEYS_GNOME_WM}/move-to-workspace-up "['<Shift><Super>Page_Up','<Shift><Super>${up}']"
# Move window one monitor to the right
dconf write ${KEYS_GNOME_WM}/move-to-monitor-right "['<Shift><Super>Right','<Shift><Super>${right}']"

dconf write ${KEYS_GNOME_WM}/switch-to-workspace-down "['<Super>Page_Down','<Primary><Super>${down}']"
dconf write ${KEYS_GNOME_WM}/switch-to-workspace-up "['<Super>Page_Up','<Primary><Super>${up}']"

# Disable tiling to left / right of screen
dconf write ${KEYS_MUTTER}/toggle-tiled-left "@as []"
dconf write ${KEYS_MUTTER}/toggle-tiled-right "@as []"

# Toggle maximization state
dconf write ${KEYS_GNOME_WM}/toggle-maximized "['<Super>m']"
dconf write ${KEYS_GNOME_WM}/toggle-fullscreen "['<Super>f']"
# Home folder
dconf write ${KEYS_MEDIA}/home "@as []"
# Launch email client
dconf write ${KEYS_MEDIA}/email "['<Super>e']"
# Launch web browser
dconf write ${KEYS_MEDIA}/www "['<Super>b']"
# Rotate Video Lock
dconf write ${KEYS_MEDIA}/rotate-video-lock-static "@as []"

# Close Window
dconf write ${KEYS_GNOME_WM}/close "['<Super>x']"

dconf write ${KEYS_MEDIA}/magnifier "['<Super>KP_Multiply']"
dconf write ${KEYS_MEDIA}/magnifier-zoom-in "['<Super>KP_Add']"
dconf write ${KEYS_MEDIA}/magnifier-zoom-out "['<Super>KP_Subtract']"
dconf write ${KEYS_MEDIA}/screenreader "@as []"

dconf write ${KEYS_GNOME_WM}/panel-run-dialog "['<Super>c']"

dconf write ${KEYS_GNOME_SHELL}/toggle-overview "@as []"

dconf write ${KEYS_GNOME_WM}/panel-main-menu "@as []"
dconf write ${KEYS_MEDIA}/logout "@as []"

