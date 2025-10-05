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

sudo add-apt-repository ppa:neovim-ppa/unstable     # fix outdated package
sudo apt update
sudo apt install -y \
    zsh \
    unzip \
    stow \
    neovim \
    ripgrep

chsh -s $(which zsh)
rm -rf .bash_history .bash_logout .bashrc

# set locale
sudo locale-gen en_US.UTF-8
sudo update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8

curl -s https://ohmyposh.dev/install.sh | bash -s

stow -t ~ zsh-deb ohmyposh nvim
