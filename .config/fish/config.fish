# Some exports
set -e fish_term24bit
set -gx PAGER ~/vimpager/vimpager
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

set fish_greeting ""
set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "exa -al --color=always --group-directories-first --icons"
alias config "/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias vim "lvim"
alias killHost "kill $(lsof -t -i:3000)" # killing localhosts

# Colorize grep output (good for log files)
alias grep "grep --color=auto"
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Pacman related
alias pacup "sudo pacman -Syu"
alias sync "sudo pacman -Sy"
alias install "sudo pacman -S"

# Mirrors
alias mirror "sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrors "sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"

# Cleanup orphaned packages
alias cleanup "sudo pacman -Rns (pacman -Qtdq)"

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end
