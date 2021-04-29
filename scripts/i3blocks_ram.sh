#!/usr/bin/env sh

# Author: AISK11
# Description: This script shows how much RAM is used (buff/cache) in percentage.
# Created for: i3blocks
# Dependencies: sys-process/procps sys-apps/grep

TOTAL_KB=$(free | grep Mem | tr -s ' ' | cut -d' ' -f2)
USED_KB=$(free | grep Mem | tr -s ' ' | cut -d' ' -f6)

echo "$((${USED_KB} * 100 / ${TOTAL_KB}))%"
