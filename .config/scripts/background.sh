#!/bin/bash
wal -q -i "$1"
source "$HOME/.cache/wal/colors.sh"
killall -SIGUSR2 waybar
