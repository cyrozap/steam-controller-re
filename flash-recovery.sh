#!/bin/bash
#
# This script writes a firmware binary to a Steam Controller in USB
# bootloader mode.
#
set -e

if [ -z "$1" -o -z "$2" ]; then
	echo "Usage: $0 block_device firmware_file"
	echo
	echo "Example: $0 /dev/sdc vcf_wired_controller_d0g_56c78c01.bin"
	exit 1
fi

BLKDEV="$1"
MOUNTPOINT=$(mktemp -d)
FIRMWARE="$2"

sudo mount "${BLKDEV}" "${MOUNTPOINT}"
sudo dd if="${FIRMWARE}" of="${MOUNTPOINT}/firmware.bin" conv=nocreat,notrunc oflag=direct bs=512
sudo umount "${MOUNTPOINT}"
