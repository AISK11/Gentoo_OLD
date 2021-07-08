#!/bin/bash

# disk like 'sda','sdb','hda','nvme0n1'...
DISK=nvme0n1

READ=$(iostat -d -y 1 1 | grep "${DISK}" | awk '{print $3}' | cut -d '.' -f 1)
WRITE=$(iostat -d -y 1 1 | grep "${DISK}" | awk '{print $4}' | cut -d '.' -f 1)

echo "Read: $READ kb/s | Write: ${WRITE} kb/s"
