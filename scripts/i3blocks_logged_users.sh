#!/usr/bin/env sh

# Author: AISK11
# Description: This script shows number of users currently logged in.
# Created for: i3blocks
# Dependencies: sys-apps/coreutils

USERS="$(who | wc -l)"

if [ "${USERS}" -gt "1" ]
then
    echo " ${USERS}!"
else
    echo " ${USERS}"
fi
