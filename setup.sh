#!/bin/bash

# shell
sudo pacman -S zsh
chsh -s $(which zsh)

# yay
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd .. && rm -rf yay

python -m ensurepip --default-pip

# basic packages
sudo pacman -S \
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

yay -S \
  oh-my-posh \
  dart-sass \
  waypaper \
  hyprshot \
  pywalfox \
  python-pywal16

# hypr and more
sudo pacman -S \
  hyprland \
  hyprpaper \
  hyprlock \
  hypridle \
  waybar \
  swaync \
  rofi-wayland \
  firefox

# list of files to keep in rofi app launcher
exclude_files=(
  "firefox.desktop"
  "htop.desktop"
  "kitty.desktop"
  "nvim.desktop"
  "nvidia-settings.desktop"
  "waypaper.desktop"
)

for file in /usr/share/applications/*.desktop; do
  file_name=$(basename "$file")
  
  if [[ ! " ${exclude_files[@]} " =~ " $file_name " ]]; then
    if ! grep -q "NoDisplay=true" "$file"; then
      echo "NoDisplay=true" >> "$file"
      echo "Updated: $file"
    fi
  fi
done

