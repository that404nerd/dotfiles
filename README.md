## That404Nerd's dotfiles
Configs of neovim, fish, zsh, bash and alacritty

## To Install: (GNU Stow)
Before you clone the repo make sure you have the following packages installed on your system:
- neovim
- fzf
- tmux
- zsh
- fish
- alacritty
- stow
- git
- yay or paru
- Iosevka Nerd Font, Jetbrains Mono Nerd Font are required

Now with that out of the way, execute the following commands to install the dotfiles:
```bash
git clone https://github.com/that404nerd/dotfiles
stow alacritty bash clangd dunst hypr i3 nvim picom polybar rofi swaync tmux wallust waybar wlogout zsh
```

## Tmux
* Original tmux config - https://github.com/hamvocke/dotfiles/blob/master/tmux/.tmux.conf (I just modified it to my liking and added couple of plugins)
* tmux-continuum - https://github.com/tmux-plugins/tmux-continuum
* tmux-resurrect - https://github.com/tmux-plugins/tmux-resurrect

## i3wm Setup
* [i3-gaps](https://github.com/Airblader/i3) - i3-gaps is a fork of i3wm
* [polybar](https://github.com/polybar/polybar) - A fast and easy-to-use tool for creating status bars
* [i3lock](https://github.com/i3/i3lock) - Improved screen locker
* [brillo](https://github.com/CameronNemo/brillo) - Controls the brightness of backlight and LED devices on Linux
* [nitrogen](https://github.com/l3ib/nitrogen) - Background browser and setter for X windows
* [picom](https://github.com/yshui/picom) - Picom is a compositor for X, and a fork of Compton
* [pamixer](https://github.com/cdemoulins/pamixer) - Pulseaudio command line mixer
* [dunst](https://github.com/dunst-project/dunst) - Lightweight and customizable notification daemon


## Hyprland Setup
This hyprland config is a modified version of [HyprLust](https://github.com/NischalDawadi/Hyprlust)

- Make sure to install these [Wallpapers](https://github.com/NischalDawadi/Wallpapers)
- Make sure the wallpapers folder is in ~/Pictures and is named Wallpapers (case-sensitive)

Install the following dependencies:

```bash
yay -S adobe-source-code-pro-fonts brightnessctl brillo chafa dunst ffmpeg ffmpegthumbnailer \
go-md2man gvfs hyprland hyprpicker-git inter-font nemo nwg-look \
noise-suppression-for-voice nordic-theme neovim otf-firamono-nerd otf-sora \
papirus-icon-theme pamixer playerctl pavucontrol polkit-gnome rofi \
sddm-git swaybg swaylock swaylock-effects swaync waybar waybar-git \
waypaper wl-clipboard wf-recorder viewnior xdg-desktop-portal-hyprland \
thunar-archive-plugin thunar-media-tags-plugin thunar-shares-plugin thunar-volman \
ttf-comfortaa ttf-fantasque-nerd ttf-icomoon-feather ttf-iosevka-nerd \
ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols-common starship wallust cpio swww wlogout feh network-manager-applet blueman
```

--- 
## Credits:
[HyprLust](https://github.com/NischalDawadi/Hyprlust) - This is the original repo used to build my modified version of Hyprland. Thanks!

[polybar-themes](https://github.com/adi1090x/polybar-themes) - A huge collection of polybar themes with different styles, colors and variants.

