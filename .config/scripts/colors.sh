#!bin/bash

eval "$(cat ~/.cache/wal/colors.sh)"

ZSH_CONFIG="$HOME/.config/ohmyposh/format.toml"
cp "$ZSH_CONFIG" "${ZSH_CONFIG}.bak"

sed -i \
  -e "s/\$color1/$color1/g" \
  -e "s/\$color2/$color2/g" \
  -e "s/\$color7/$color7/g" \
  "$ZSH_CONFIG"
