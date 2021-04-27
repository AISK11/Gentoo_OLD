#!/usr/bin/env sh

# Author: AISK11
# Description: This script show, if microphone is in use.
# Created for: i3bar
# Dependencies: amixer

MIC_STATUS=$(amixer get Capture | grep -e "Left.*\[" | cut -d']' -f2 | rev | cut -d'[' -f1 | rev)

if [ "${MIC_STATUS}" = "off" ]
then
    echo ""
elif [ "${MIC_STATUS}" = "on" ]
then
    echo ""
else
    echo "UNKNOWN!"    
fi
