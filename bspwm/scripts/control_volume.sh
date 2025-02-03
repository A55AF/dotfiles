#!/bin/bash


volume=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | tr -d '%')

echo "Current volume: $volume%"

if [[ $1 == "-i" ]]; then
    if [[ $volume -le 120 ]]; then
        pactl set-sink-volume @DEFAULT_SINK@ +5%
        echo "Volume increased by 5%."
    else
        echo "Volume is already at maximum."
    fi
elif [[ $1 == "-d" ]]; then
    pactl set-sink-volume @DEFAULT_SINK@ -5%
    echo "Volume decreased by 5%."
elif [[ $1 == "-m" ]]; then
    pactl set-sink-mute @DEFAULT_SINK@ toggle
else
    echo "Invalid option. Use -i to increase or -d to decrease the volume."
fi
