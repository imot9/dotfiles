#!/bin/bash

# shell
pacman -S zsh
chsh -s $(which zsh)

# yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si
cd .. && rm -rf yay

# basic packages
pacman -S \
  less \
  neovim \
  stow \
  ttf-firacode-nerd \
  ttf-font-awesome \
  kitty \
  lazygit \
  pamixer \
  brightnessctl \
  cliphist \
  fzf \
  fastfetch

yay -S \
  oh-my-posh \
  dart-sass \
  waypaper \
  hyprshot \
  pywalfox 

# hypr and more
pacman -S \
  hyprland \
  hyprpaper \
  hyprlock \
  waybar \
  swaync \
  rofi-wayland

# hide .desktop files in rofi
for file in "/usr/share/applications/*.desktop"
do
  echo "NoDisplay=true >> $file";
done

# browser (last step not to remove the .desktop file)
pacman -S firefox
