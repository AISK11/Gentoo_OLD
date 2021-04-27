#!/usr/bin/env sh

# Author: AISK11
# Description: This script calculates network throughput for interface "wlan0" in b/s every second.
# 1 MB/s = 8 Mb/s
# 1 Mb/s = 1,000 kb/s = 1,000,000 b/s

# interfaces=<eth0|wlan0|lo>
INTERFACE="wlan0"
INTERFACE_STATE=$(ip a | grep ${INTERFACE} | grep -v "inet" | cut -d' ' -f9)

if [ "${INTERFACE_STATE}" = "DOWN" ]
then
    printf "DOWN\n"
elif [ "${INTERFACE_STATE}" = "UP" ]
then
    RX_OLD=$(cat /sys/class/net/${INTERFACE}/statistics/rx_bytes)
    TX_OLD=$(cat /sys/class/net/${INTERFACE}/statistics/tx_bytes)
    sleep 1
    RX_NEW=$(cat /sys/class/net/${INTERFACE}/statistics/rx_bytes)
    TX_NEW=$(cat /sys/class/net/${INTERFACE}/statistics/tx_bytes)
    RX_BYTES=$(( ${RX_NEW} - ${RX_OLD} ))
    TX_BYTES=$(( ${TX_NEW} - ${TX_OLD} ))
    # Debug # echo "RX ${RX_BYTES} B/s; TX ${TX_BYTES} B/s"
    RX_BITS=$(( ${RX_BYTES} * 8))
    TX_BITS=$(( ${TX_BYTES} * 8))
    if [ "${TX_BITS}" -ge "1000000" ] || [ "${RX_BITS}" -ge "1000000" ]
    then
        RX_BITS=$(( ${RX_BITS} / 1000000 ))
        TX_BITS=$(( ${TX_BITS} / 1000000 ))
        printf "RX %04d Mb/s; TX %4d Mb/s\n" ${RX_BITS} ${TX_BITS}
    elif [ "${TX_BITS}" -ge "1000" ] || [ "${RX_BITS}" -ge "1000" ]
    then
        RX_BITS=$(( ${RX_BITS} / 1000 )) 
        TX_BITS=$(( ${TX_BITS} / 1000 ))
        printf "RX %04d kb/s; TX %4d kb/s\n" ${RX_BITS} ${TX_BITS}
    else
        printf "RX %04d  b/s; TX %4d  b/s\n" ${RX_BITS} ${TX_BITS}
    fi
else
    printf "UNKNOWN\n"
fi
