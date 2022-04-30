export ZSH="$HOME/.oh-my-zsh"

SH_THEME="robbyrussell"
plugins=(
   git
   zsh-autosuggestions
   zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Aliases
alias ls="ls -la"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias vim="nvim"
alias zm="cd $HOME/Documents/systemcoding-website/ && vim ."


