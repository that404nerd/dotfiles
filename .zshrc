export PATH=/home/revanth/.cargo/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export TERM="xterm-256color"                      
export HISTCONTROL=ignoredups:erasedups 

ZSH_THEME=bira

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
autoload bashcompinit
bashcompinit
source /usr/share/bash-completion/completions/pacstall

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
