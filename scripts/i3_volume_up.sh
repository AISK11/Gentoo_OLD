#!/usr/bin/env sh

# Author: AISK11
# Description: This script will increase audio volume by 10% up to 100%.
# Created for: ~/.config/i3/config:
# bindsym XF86AudioRaiseVolume exec --no-startup-id ~/.config/i3/scripts/i3_volume_up.sh 
# bindsym XF86AudioLowerVolume exec --no-startup-id pactl set-sink-volume @DEFAULT_SINK@ -10%
# bindsym XF86AudioMute exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle
# bindsym XF86AudioMicMute exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle
# Dependencies: pactl
# BUG: Audio can be raised above 100% when audio is not played. When audio is played and raised again, it will fall to 100%.

VOLUME=$(pactl list sinks | grep -A9 "RUNNING" | grep "Volume" | cut -d'/' -f2 | cut -d'%' -f1)

if [ "${VOLUME}" -ge "100" ]
then
    pactl set-sink-volume @DEFAULT_SINK@ 100%
else
    pactl set-sink-volume @DEFAULT_SINK@ +10%
fi
