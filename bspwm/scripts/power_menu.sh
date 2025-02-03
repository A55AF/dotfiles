#!/bin/bash

# Show the power menu
chosen=$(echo -e "Shutdown\nReboot\nSuspend\nLock\nLogout" | rofi -dmenu -p "Power Menu:" -theme /home/assaf/.config/rofi/powermenu/style-3.rasi)

case "$chosen" in
    Shutdown)
        systemctl poweroff
        ;;
    Reboot)
        systemctl reboot
        ;;
    Suspend)
        systemctl suspend
        ;;
    Lock)
        i3lock -i ~/Pictures/i3lock/image.png
        ;;
    Logout)
        i3-msg exit
        ;;
    *)
        # Do nothing if canceled or invalid option
        ;;
esac
