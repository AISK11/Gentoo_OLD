#!/usr/bin/env sh

# Author: AISK11
# Description: This script shows CPU utilization in percentage.
# Created for: i3blocks
# Dependencies: sys-apps/coreutils app-admin/sysstat

USAGE=$((10000 - $(mpstat 1 1 | tail -n 1 | rev | cut -d' ' -f1 | rev | tr -d .)))

USAGE1=$((${USAGE} / 100))
USAGE2=$((${USAGE} % 100))

printf "%3d.%02d%%\n" ${USAGE1} ${USAGE2}
