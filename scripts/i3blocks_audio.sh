#!/usr/bin/env sh

# Author: AISK11
# Description: This script shows current volume or status of the audio.
# Created for: i3blocks
# Dependencies: sys-apps/coreutils sys-apps/grep sys-apps/util-linux

AUDIO_MUTED=$(amixer get Master | grep -e "Left.*\[" | cut -d']' -f2 | rev | cut -d'[' -f1 | rev)
AUDIO_STATUS=$(amixer get Master | grep -e "Left.*\[" | cut -d']' -f1 | rev | cut -d'[' -f1 | rev)

if [ "${AUDIO_MUTED}" = "off" ]
then
    echo ""
else
    echo "${AUDIO_STATUS}"    
fi
