
# Some exports
set fish_greeting ""
set -gx TERM xterm-256color
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH

set -e fish_user_paths
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -la"
alias config "/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME"
alias vim "nvim"
alias zm "cd $HOME/Documents/systemcoding-website/ && vim ."

# Colorize grep output (good for log files)
alias grep "grep --color=auto"

# Pacman related
alias pacup "sudo pacman -Syu"
alias sync "sudo pacman -Sy"
alias install "sudo pacman -S"

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
  source $LOCAL_CONFIG
end

starship init fish | source
