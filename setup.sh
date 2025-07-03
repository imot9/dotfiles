#!/bin/bash

set -e

DOTFILES_DIR=~/dotfiles
if [[ "$(pwd)" != "$DOTFILES_DIR" ]]; then
    echo "Changing to $DOTFILES_DIR..."
    cd "$DOTFILES_DIR" || {
        echo "Error: Cannot change to $DOTFILES_DIR. Ensure it exists."
        exit 1
    }
fi

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

# basic packages
sudo pacman -S --noconfirm \
  less \
  unzip \
  ripgrep \
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

mkdir -p ~/.local/share/applications
cp /usr/share/applications/*.desktop ~/.local/share/applications/

echo "Select the .desktop files you want to keep visible (space to select):"
selected_files=$(ls ~/.local/share/applications/*.desktop | gum choose --no-limit)

for file in ~/.local/share/applications/*.desktop; do
    if [[ ! "$selected_files" =~ "$file" ]]; then
        sed -i '/NoDisplay=true/d' "$file"
        echo "NoDisplay=true" >> "$file"
        echo "Hidden: $file"
    else
        echo "Kept: $file"
    fi
done

stow .
wal -q -i ~/.config/backgrounds/default.jpg

echo "Removing orphan packages ..."
sudo pacman -Rns $(pacman -Qtdq)

echo "Cleaning cache ..."
sudo pacman -Scc
