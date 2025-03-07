#!/bin/bash

# change wallpaper with pywal -> swaybg
# write by beersanp

# Get wallpaper directory
# if you need to change to other location
wallpaper_dir="$HOME/Pictures/Wallpaper"

# List all wallpaper filenames in the directory
wallpapers=$(find "$wallpaper_dir" -type f -name "*.jpg" -o -name "*.png")

# Use rofi to select a wallpaper
selected_file=$(echo "$wallpapers" | rofi -dmenu -p "Select Wallpaper: ")

# Check if a file was selected
if [[ -n "$selected_file" ]]; then
  # generate wal -> change wallpaper with swaybg
  wal -i $selected_file
  bash $HOME/.config/sway/script/wallpaper-script/apply-theme.sh
  bash $HOME/.config/sway/script/zed-theme-wal/generate_theme
  sway reload
  notify-send "Wallpaper Changed" "Successfully set '$selected_file' as wallpaper\n recheck QT Theme"
else
  notify-send "Wallpaper Change Cancelled" "No wallpaper selected"
fi
