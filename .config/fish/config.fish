############ This config is a modified version of the default fish config provided by Garuda Linux ###############	

# Hide welcome message & ensure we are reporting fish as shell	
set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT 1
set -xU MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -xU MANROFFOPT -c
set -x SHELL /usr/bin/fish
set TERM screen-256color

## Export variable need for qt-theme	
if type qtile >>/dev/null 2>&1
    set -x QT_QPA_PLATFORMTHEME qt5ct
end

# Set settings for https://github.com/franciscolourenco/done	
set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low

## Environment setup	
# Apply .profile: use this to put fish compatible .profile stuff in	
if test -f ~/.fish_profile
    source ~/.fish_profile
end

# Add ~/.local/bin to PATH	
if test -d ~/.local/bin
    if not contains -- ~/.local/bin $PATH
        set -p PATH ~/.local/bin
    end
end

## Starship prompt	
if status --is-interactive
    source ("/usr/bin/starship" init fish --print-full-init | psub)
end


## Advanced command-not-found hook	
source /usr/share/doc/find-the-command/ftc.fish

if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

# Fish command history	
function history
    builtin history --show-time='%F %T '
end

## Useful aliases	

# Replace ls with eza	
alias ls 'eza -al --color=always --group-directories-first --icons' # preferred listing	
alias ll 'eza -l --color=always --group-directories-first --icons' # long format	

# Replace some more things with better alternatives	
alias cat 'bat --style header --style snip --style changes --style header'
if not test -x /usr/bin/yay; and test -x /usr/bin/paru
    alias yay paru
end

# Common use	
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias vim nvim
alias tmux 'tmux -u'
alias wget 'wget -c '
alias config '/usr/bin/git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias source-fish 'source ~/.config/fish/config.fish'
alias vcpkg '~/.local/share/applications/vcpkg/vcpkg'

# Get fastest mirrors	
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'
