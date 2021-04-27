#!/usr/bin/env sh

# Author: AISK11
# Description: This script will connect wlan0 to BSSID saved in wpa_supplicant via DHCP without overwriting DNS settings, without trying to use last leased IP with random MAC address.
# Created for: Manual execution
# Dependencies: openrc, doas, macchanger, dhcpcd, wpa_supplicant
# Requirements: /etc/doas.conf:
# permit nopass :wheel

INTERFACE="wlan0"

doas macchanger -Ab ${INTERFACE}
doas rfkill unblock wlan
doas rm -f /var/lib/dhcpcd/*
doas ip l set ${INTERFACE} up
doas rc-service wpa_supplicant start
doas dhcpcd -4 -C resolv.conf ${INTERFACE}
