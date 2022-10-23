#!/bin/bash
# SPDX-License-Identifier: 0BSD

# Copyright (C) 2018 by Forest Crossman <cyrozap@gmail.com>
#
# Permission to use, copy, modify, and/or distribute this software for
# any purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL
# WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE
# AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL
# DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR
# PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
# TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
# PERFORMANCE OF THIS SOFTWARE.


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
