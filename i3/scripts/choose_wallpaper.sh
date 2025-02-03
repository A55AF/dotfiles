#!/bin/bash

path=$HOME/Pictures/Wallpapers/
chosen=$(for a in $path/* ; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -theme $HOME/.config/rofi/themes/choose_wallpaper.rasi )
echo $chosen > $HOME/.config/bspwm/wallpaper
feh --bg-scale $(cat $HOME/.config/bspwm/wallpaper)  &
