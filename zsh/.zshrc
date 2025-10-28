autoload -U compinit && compinit

export QT_QPA_PLATFORMTHEME="qt5ct"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

source "${ZINIT_HOME}/zinit.zsh"
## Install Plugins
zinit ice depth=1;

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light Aloxaf/fzf-tab

zstyle ':completion*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion*' menu no

zinit cdreplay -q # Load cache

HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

unsetopt BEEP

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

mv-progress() {
  if [ "$#" -ne 2 ]; then
      echo "Usage: mv-progress source destination"
      return 1
  fi
  rsync -ah --progress "$1" "$2" && rm -rf "$1"
}

cp-progress() {
   if [ "$#" -ne 2 ]; then
      echo "Usage: mv-progress source destination"
      return 1
  fi
  rsync -ah --progress "$1" "$2"
}

# Aliases
alias ls="exa -al --color=always --group-directories-first --icons"
alias vim="nvim" # Use Neovim
alias start-virsh='sudo virsh net-start default'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Pacman related (Arch)
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias cleanup="sudo pacman -Rns (pacman -Qtdq)"

# Nix Aliases:
alias nixos-config="vim $HOME/.config/nix/configuration.nix"
alias nixos-build="sudo nixos-rebuild switch --flake ~/.config/nix"

alias tmux="tmux -u"
alias wget="wget -c"
alias source-zsh="source ~/.zshrc"
alias vcpkg="~/.local/share/applications/vcpkg/vcpkg"
alias os-install-date="stat / | grep Birth"  # A shitty way to get the date of installation

if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

eval "$(starship init zsh)"
export MAKEFLAGS="-j$(nproc)"
