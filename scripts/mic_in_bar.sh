#!/usr/bin/env sh

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
