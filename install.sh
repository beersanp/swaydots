#!/bin/bash

# using fedora

clear

echo "sys update"
sudo dnf update -y
sudo dnf install 'dnf-command(copr)'
sleep 3
echo "add rpmfushion"
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
echo "finished! add rpmfusion"
sleep 3
clear
sleep 3
echo "add copr"

sudo dnf copr enable -y swayfx/swayfx
sudo dnf copr enable -y lyessaadi/gradience
sudo dnf copr enable -y che/nerd-fonts 

echo "install dependence software"
echo chezmoi
sudo dnf install -y https://github.com/twpayne/chezmoi/releases/download/v2.51.0/chezmoi-2.51.0-x86_64.rpm
sleep 3
clear

echo "install sway"
sudo dnf install -y swayfx waybar gnome-keyring  rofi btop kvantum NetworkManager foot kde-connect neovim flatpak jq grim slurp wl-clipboard libnotify ImageMagick mpd mpv nautilus python-pip ncmpcpp nerd-fonts jetbrains-mono-fonts gnome-keyring --allowerasing
sleep 2
echo "install starship"

curl -sS https://starship.rs/install.sh | sh
echo "setting up"

# sudo systemctl enable sddm.service
# systemctl set-default graphical.target # if install "as mimimal fedora"

echo "init dotfile"
chezmoi init https://github.com/beersanp/swaydots.git
chezmoi cd
rm dot_gitconfig
chezmoi apply

echo "init pywal"
sudo pip install pywal16
wal -i /usr/share/backgrounds/sway/Sway_Wallpaper_Blue_1920x1080.png

echo "it's finished, you're need to setup your login manager and reboot!"
