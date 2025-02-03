#!/bin/bash

lock=""
shutdown=""
reboot=""
suspend=""
logout=""
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout\n"

# Use rofi to display the menu
chosen=$(echo -e "$options" | rofi -dmenu -p "System" -theme ~/.config/rofi/themes/power_menu.rasi)

# Take action based on selection
case "$chosen" in
    $lock)
        i3lock -i ~/Pictures/i3lock/image.png
        ;;
    $logout)
        bspc quit
        ;;
    $reboot)
        systemctl reboot
        ;;
    $shutdown)
        systemctl poweroff
        ;;
    $suspend)
        systemctl suspend
        ;;
    *)
        # Do nothing on invalid input
        ;;
esac
