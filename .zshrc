# macOS only
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# aliases
alias vim='nvim'
alias ls='ls --color'

# init ZINIT
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git" 

if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load ZINIT
source "${ZINIT_HOME}/zinit.zsh"

# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

## highlight
grey="6c6c6c"
red="#722F37"
green="#2E8B57"
blue="#6F8FAF"
magenta="#8b008b"

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=${green},underline
ZSH_HIGHLIGHT_STYLES[unknown-token]=fg=${red},underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=${green},underline
ZSH_HIGHLIGHT_STYLES[command]=fg=${green},underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=${blue}

## completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview "ls --color $realpath"

## search
eval "$(fzf --zsh)"

# init & load OMP
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/format.toml)"

# keybindings
bindkey -e
bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# misc
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Pipx
export PATH="$PATH:~/.local/bin"

neofetch
