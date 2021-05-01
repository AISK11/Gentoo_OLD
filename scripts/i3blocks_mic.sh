#!/usr/bin/env sh

# Author: AISK11
# Description: This script shows, if microphone is in use.
# Created for: i3blocks
# Dependencies: sys-apps/coreutils sys-apps/grep sys-apps/util-linux media-sound/alsa-utils

MIC_STATUS=$(amixer get Capture | grep -e "Left.*\[" | cut -d']' -f2 | rev | cut -d'[' -f1 | rev)

if [ "${MIC_STATUS}" = "off" ]
then
    echo "off"
elif [ "${MIC_STATUS}" = "on" ]
then
    echo "on"
else
    echo "UNKNOWN!"    
fi
