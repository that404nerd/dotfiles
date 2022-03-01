# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
else
   export EDITOR='mvim'
fi

# ls aliases
alias ll="ls -lah"

# emacs and repair
alias em="/usr/bin/emacs -nw"
alias emacs="emacsclient -c -a 'emacs'"
alias doomsync="~/.emacs.d/bin/doom sync"
alias doomdoctor="~/.emacs.d/bin/doom doctor"
alias doomupgrade="~/.emacs.d/bin/doom upgrade"
alias doompurge="~/.emacs.d/bin/doom purge"

# some other useful aliases
alias vim="nvim"
alias config="/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME" # for bare repos
alias exa="la -lah"
alias record="ffmpeg"
alias TERM="xterm-256color"
alias cls="clear"

pfetch
eval "$(starship init zsh)"
