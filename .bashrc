#!/bin/bash

# Exports
export PATH=/home/revanth/.cargo/bin:$PATH
export TERM="xterm-256color"
export HISTCONTROL=ignoredups:erasedups
# Compilation flags
export ARCHFLAGS="-arch x86_64"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Set neovim to be the default editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='lvim'
fi

### PATH
if [ -d "$HOME/.bin" ] ;
  then PATH="$HOME/.bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ;
  then PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/Applications" ] ;
  then PATH="$HOME/Applications:$PATH"
fi

# Aliases
alias ls="exa -al --color=always --group-directories-first --icons"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias vim="nvim" # Use Neovim
alias killHost="kill $(lsof -t -i:3000)" # killing localhosts

# Mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"

# Cleanup orphaned packages
alias cleanup="sudo pacman -Rns (pacman -Qtdq)"

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Pacman related
alias pacup="sudo pacman -Syu"
alias sync="sudo pacman -Sy"
alias install="sudo pacman -S"
