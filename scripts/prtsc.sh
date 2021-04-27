#!/usr/bin/env sh
if [ -d ~/.screenshots/ ]
then
    scrot --silent --pointer ~/.screenshots/$(date '+%Y-%m-%d_%H:%M:%S').png
else
    mkdir -p ~/.screenshots/
    scrot --silent --pointer ~/.screenshots/$(date '+%Y-%m-%d_%H:%M:%S').png
fi
