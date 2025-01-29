#!/bin/bash

if [ -z "$1" ]; then
  wallpaper="~/.config/backgrounds/default.jpg"
else
  wallpaper="$1"
  killall -SIGUSR2 waybar
fi

wal -q -i $wallpaper
source "$HOME/.cache/wal/colors.sh"
sass ~/.config/swaync/style.scss ~/.config/swaync/style.css
swaync-client -rs
rm ~/.config/swaync/style.css.map
