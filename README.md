## That404Nerd's dotfiles
Configs of neovim, fish, zsh, bash and alacritty

Some of the scripts like in `(.local/bin)` are not mine and a README.md file is added in that directory, so please check that out!
Make sure to follow this playlist for more info (Eric Murphy) - https://youtube.com/playlist?list=PLnur5_dvCveFGV8tKbH9sdqOSBUlFNQrR

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
- Any Nerd Font

Now with that out of the way, execute the following commands to install the dotfiles:
```bash
git clone https://github.com/that404nerd/dotfiles
stow --adopt . # for all configs
```

## Lunarvim
* Default C/C++ Configuration - https://github.com/LunarVim/starter.lvim/tree/c-ide
* Lunarvim launch issue (-u option error) - https://github.com/LunarVim/LunarVim/issues/3612#issuecomment-1379895972

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

Additional packages:
```
cronie
acpi
```

For battery notifications (dunst) install `cronie` using your package manager and execute the following command:
`crontab -e`
Add the following line:
`*/10 * * * * /home/username/.local/bin/battery-notify.sh`

Move the `.local/udev_rules/powersave.rules` to `/etc/udev/rules.d/`
And then execute:
`sudo udevadm control --reload`

Replace 10 (time in minutes) with whatever number you want. It checks for the battery status every 10 minutes in this case.
Watch this video for more info - https://www.youtube.com/watch?v=3wTt6fStYCI

## Hyprland Setup
This hyprland config is a forked version of [ChrisTitusTech](https://github.com/ChrisTitusTech/hyprland-titus).
Install the following dependencies:
```bash
yay -S hyprland polkit-gnome ffmpeg neovim viewnior rofi    \
pavucontrol nemo starship wl-clipboard wf-recorder swaybg   \
grimblast-git ffmpegthumbnailer tumbler playerct             \
noise-suppression-for-voice gvfs                             \
waybar-hyprland wlogout swaylock-effects sddm-git pamixer     \
nwg-look-bin nordic-theme papirus-icon-theme dunst otf-sora   \
ttf-nerd-fonts-symbols-common otf-firamono-nerd inter-font    \
ttf-fantasque-nerd noto-fonts noto-fonts-emoji ttf-comfortaa  \
ttf-jetbrains-mono-nerd ttf-icomoon-feather ttf-iosevka-nerd  \
adobe-source-code-pro-fonts brightnessctl hyprpicker-git libinput \
swaylock waybar waypaper go-md2man brillo
```
For brillo: (If it doesn't work due to permission issues)

```bash
sudo vim /etc/udev/rules.d/90-backlight.rules
```

Add the following line to the file:
`ACTION=="add", SUBSYSTEM=="backlight", KERNEL=="intel_backlight", RUN+="/bin/chmod 0666 /sys/class/backlight/%k/brightness"`

If intel_backlight is not the correct backlight device, you might need to check the exact device name in /sys/class/backlight/ and replace intel_backlight with the appropriate name. Then,

```bash
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo usermod -aG video $USER
```

Then copy `.config/hypr` and `.config/waybar` into `$HOME/.config`

---
### (Optional)
[polybar-themes](https://github.com/adi1090x/polybar-themes) - A huge collection of polybar themes with different styles, colors and variants.
