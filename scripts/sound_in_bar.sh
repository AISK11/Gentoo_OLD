#!/usr/bin/env sh

# Author: AISK11
# Description: This script will decrease screen brightness by 10%, but prevent 0% brightness.
# Created for: i3bar
# Dependencies: amixer

AUDIO_MUTED=$(amixer get Master | grep -e "Left.*\[" | cut -d']' -f2 | rev | cut -d'[' -f1 | rev)
AUDIO_STATUS=$(amixer get Master | grep -e "Left.*\[" | cut -d']' -f1 | rev | cut -d'[' -f1 | rev)

if [ "${AUDIO_MUTED}" = "off" ]
then
    echo ""
else
    echo "${AUDIO_STATUS}"    
fi
