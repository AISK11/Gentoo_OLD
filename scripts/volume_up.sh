#!/usr/bin/env sh

# Author: AISK11
# Description: This script will decrease screen brightness by 10%, but prevent 0% brightness.
# Created for: ~/.config/i3/config:
# bindsym XF86MonBrightnessUp exec xbacklight -inc 10
# bindsym XF86MonBrightnessDown exec ~/.config/i3/scripts/brightness_decrease.sh
# Dependencies: xbacklight

VOLUME=$(pactl list sinks | grep -A9 "RUNNING" | grep "Volume" | cut -d'/' -f2 | cut -d'%' -f1)

if [ "${VOLUME}" -ge "100" ]
then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
else
    pactl set-sink-volume @DEFAULT_SINK@ +10%
fi
