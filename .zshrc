export PATH=$HOME/.cargo/bin:$PATH
export PATH="$HOME/.local/bin":$PATH
export PATH="/usr/local/bin":$PATH
export DOTNET_ROOT=/snap/dotnet-sdk/current
export ZSH="$HOME/.zsh"
export TERM="xterm-256color"

# some useful options
setopt autocd extendedglob nomatch menucomplete
unsetopt BEEP

# auto-completion and stuff
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.
fpath=($ZSH/zsh-completions/src/ $fpath)

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# Load colors
autoload -Uz colors && colors

source "$ZSH/utils/zsh-functions"
source "$ZSH/utils/zsh-prompt"
source "$ZSH/utils/zsh-vim-mode"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
zsh_add_plugin "hlissner/zsh-autopair"

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

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Some functions
apt() { 
  command nala "$@"
}

sudo() {
  if [ "$1" = "apt" ]; then
    shift
    command sudo nala "$@"
  else
    command sudo "$@"
  fi
}

# Aliases
alias ls="exa -al --color=always --group-directories-first --icons"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias killHost="kill $(lsof -t -i:3000)" # killing localhosts
alias vim="nvim" # Use Neovim

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Pacman related (Arch)
alias pacup="sudo pacman -Syu"
alias pacsync="sudo pacman -Sy"
alias pacinstall="sudo pacman -S"
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias cleanup="sudo pacman -Rns (pacman -Qtdq)"

# nix package manager 
alias nix-install="nix-env -iA"
alias nix-remove="nix-env -e"
alias nix-update="nix-env -u"
alias nix-list="nix-env -q"

# recording using ffmpeg (X11)
alias record-screen="ffmpeg -video_size 1366x768 -framerate 60 -f x11grab -i :0.0+0,0 -f pulse -ac 2 -i 0 -c:v libx264rgb -preset ultrafast $HOME/Videos/ScreenRecordings/output.mkv"

if [ -e /home/revanth/.nix-profile/etc/profile.d/nix.sh ]; then . /home/revanth/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
