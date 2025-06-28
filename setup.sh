#!/bin/bash

set -e

# shell
sudo pacman -S --noconfirm zsh
chsh -s $(which zsh)

# yay
if ! command -v yay &>/dev/null; then
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay && makepkg -si --noconfirm
    cd .. && rm -rf yay
fi

# python
sudo pacman -S --noconfirm python python-pip
python -m ensurepip --default-pip

# basic packages
sudo pacman -S --noconfirm \
  less \
  neovim \
  vi \
  stow \
  ttf-firacode-nerd \
  ttf-font-awesome \
  kitty \
  lazygit \
  pamixer \
  pavucontrol \
  brightnessctl \
  cliphist \
  fzf \
  inxi \
  fastfetch \
  htop

yay -S --noconfirm \
  oh-my-posh \
  dart-sass \
  waypaper \
  hyprshot \
  pywalfox \
  python-pywal16

# hypr and more
sudo pacman -S --noconfirm \
  hyprland \
  hyprpaper \
  hyprlock \
  hypridle \
  waybar \
  swaync \
  rofi-wayland \
  firefox


# hide .desktop files in rofi
sudo pacman -S --noconfirm gum

echo "Select the .desktop files you want to keep visible in the Rofi app launcher:"
all_files=(/usr/share/applications/*.desktop)
selected_files=$(printf "%s\n" "${all_files[@]}" | gum choose --no-limit)

if [[ -z "$selected_files" ]]; then
    echo "No files selected. Exiting."
    exit 1
fi

for file in "${all_files[@]}"; do
    if [[ ! "$selected_files" =~ "$file" ]]; then
        if ! grep -q "NoDisplay=true" "$file"; then
            echo "NoDisplay=true" >> "$file"
            echo "Hidden: $file"
        fi
    else
        echo "Kept: $file"
    fi
done
