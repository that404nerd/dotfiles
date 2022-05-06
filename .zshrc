# zsh shell configuration

export PATH=/home/revanth/.cargo/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"                      
export HISTCONTROL=ignoredups:erasedups 

SH_THEME="robbyrussell"
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
   export EDITOR='nvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Aliases
alias ls="ls -la"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias vim="nvim"
alias zm="cd $HOME/Documents/systemcoding-website/ && vim ."

# Colorize grep output (good for log files)
alias grep='grep --color=auto'

# Pacman related
alias pacup="sudo pacman -Syu"
alias sync="sudo pacman -Sy"
alias install="sudo pacman -S"

pfetch
eval "$(starship init zsh)"
