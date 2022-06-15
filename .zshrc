# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/home/revanth/.cargo/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"                      
export HISTCONTROL=ignoredups:erasedups 

SH_THEME="powerlevel10k/powerlevel10k"
plugins=(
   git
   zsh-autosuggestions
   zsh-syntax-highlighting
)

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

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='lvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Aliases
alias ls="ls -la"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias killHost "kill $(lsof -t -i:3000)" # killing localhosts
alias vim="lvim" # Use Lunarvim

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Pacman related
alias pacup="sudo pacman -Syu"
alias sync="sudo pacman -Sy"
alias install="sudo pacman -S"

# Mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"

# Cleanup orphaned packages
alias cleanup="sudo pacman -Rns (pacman -Qtdq)"

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
