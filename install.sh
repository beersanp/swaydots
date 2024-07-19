#!/bin/bash

# from fedora-everything

clear

mkdir temp-dotfile && cd temp-dotfile || exit
echo "sys update"
sudo dnf update

echo "add rpmfushion"
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
echo "finished! add rpmfusion"
clear

echo "add copr"

sudo dnf copr enable swayfx/swayfx
sudo dnf copr enable lyessaadi/gradience
sudo dnf copr enable che/nerd-fonts 

echo "install dependence software"
sudo dnf install swayfx waybar rofi btop kvantum NetworkManager foot kde-connect nvim flatpak swaybg jq grim slurp wl-clipboard libnotify ImageMagick mpd mpv nautilus python-pip ncmpcpp nerd-fonts jetbrains-mono-fonts



echo "setting up"
# sudo systemctl enable sddm.service
# systemctl set-default graphical.target # if install "as mimimal fedora"
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
