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
  wal -i "$selected_file"
  sway reload
  notify-send "Wallpaper Changed" "Successfully set '$selected_file' as wallpaper"
else
  notify-send "Wallpaper Change Cancelled" "No wallpaper selected"
fi
