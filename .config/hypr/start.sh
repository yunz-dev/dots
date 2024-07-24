#!/usr/bin/env bash

# initialise wallpaper
swww init &
# set wallpaper
swww img ~/Downloads/wallpaper.jpg &
#
nm-applet --indicator &

waybar &
