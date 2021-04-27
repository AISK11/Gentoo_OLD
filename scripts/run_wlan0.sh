#!/usr/bin/env sh

# Author: AISK11
# Description: This script will connect wlan0 to BSSID saved in wpa_supplicant via DHCP without overwriting DNS settings, without trying to use last leased IP with random MAC address
# Created for: Manual execution
# Dependencies: openrc, macchanger, dhcpcd, wpa_supplicant

doas macchanger -Ab wlan0
doas rfkill unblock wlan
doas rm -f /var/lib/dhcpcd/*
doas ip l set wlan0 up
doas rc-service wpa_supplicant start
doas dhcpcd -4 -C resolv.conf wlan0
