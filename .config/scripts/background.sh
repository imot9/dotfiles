#!/bin/bash
wal -q -i "$1"
source "$HOME/.cache/wal/colors.sh"
killall -SIGUSR2 waybar
sass ~/.config/swaync/style.scss ~/.config/swaync/style.css
swaync-client -rs
rm ~/.config/swaync/style.css.map
