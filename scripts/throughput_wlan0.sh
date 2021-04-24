#!/usr/bin/env sh

# 1 MB/s = 8 Mb/s
# 1 Mb/s = 1,000 kb/s = 1,000,000 b/s

# interfaces=<eth0|wlan0|lo>
INTERFACE="wlan0"
INTERFACE_STATE=$(ip a | grep ${INTERFACE} | grep -v "inet" | cut -d' ' -f9)

if [ "${INTERFACE_STATE}" = "DOWN" ]
then
    echo "DOWN"
elif [ "${INTERFACE_STATE}" = "UP" ]
then
    RX_OLD=$(cat /sys/class/net/${INTERFACE}/statistics/rx_bytes)
    TX_OLD=$(cat /sys/class/net/${INTERFACE}/statistics/tx_bytes)
    sleep 1
    RX_NEW=$(cat /sys/class/net/${INTERFACE}/statistics/rx_bytes)
    TX_NEW=$(cat /sys/class/net/${INTERFACE}/statistics/tx_bytes)
    TX_BYTES=$(( ${TX_NEW} - ${TX_OLD} ))
    RX_BYTES=$(( ${RX_NEW} - ${RX_OLD} ))
    echo "RX ${RX_BYTES} B/s; TX ${TX_BYTES} B/s"
    TX_BITS=$(( ${TX_BYTES} * 8))
    RX_BITS=$(( ${RX_BYTES} * 8))

    if [ "${TX_BITS}" -ge "1000000" ] || [ "${RX_BITS}" -ge "1000000" ]
    then
        RX_BITS=$(( ${RX_BITS} / 1000000 ))
        TX_BITS=$(( ${TX_BITS} / 1000000 ))
        echo "RX ${RX_BITS} Mb/s; TX ${TX_BITS} Mb/s"
    elif [ "${TX_BITS}" -ge "1000" ] || [ "${RX_BITS}" -ge "1000" ]
    then
        RX_BITS=$(( ${RX_BITS} / 1000 ))
        TX_BITS=$(( ${TX_BITS} / 1000 ))
        echo "RX ${RX_BITS} kb/s; TX ${TX_BITS} kb/s"
    else
        echo "RX = ${RX_BITS} b/s; TX = ${TX_BITS} b/s"
    fi
else
    echo "UNKNOWN"
fi


