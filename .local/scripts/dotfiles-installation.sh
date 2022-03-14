#!/bin/bash

welcomeMessage() {
   echo "This is an installation of my dotfiles (For Arch)"
   echo "For more info check https://github.com/systemcoding/dotfiles"
   sleep 1s
}

checkDependencies() {
   declare -a packages=( "xmonad" "neovim" "curl" "wget" "git" "zsh" "fish", "picom" )
   for package in $packages
   do
	   if pacman -Qs $package; then
		   sudo pacman -S $package
		   echo "Installed required packages"
	   fi
  done
}

cloneRepos() {
  sudo pacman -Sy git
  cd $HOME
  git clone https://github.com/systemcoding/dotfiles ~/Installation-repo
  cd Installation-repo 
}

moveConfigs() {
  local nvimDir=$HOME/.config/nvim
  local alacrittyDir=$HOME/.config/alacritty
  local polybarDir=$HOME/.config/polybar
  local xmonadDir=$HOME/.xmonad
  echo "Looking for conflicts..."
  if [[ -d $nvimDir ]]
  then
	echo "Making a backup of your current neovim config..."
	mv $nvimDir $HOME/.config/nvim-bak
  fi 
  echo "Moving neovim config..."
  mv .config/nvim $HOME/.config/

}

welcomeMessage
checkDependencies
cloneRepos
moveConfigs
