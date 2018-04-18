#!/bin/bash
# This script minimizes the size of images.
# It should be run on non-Docker, base Linux images.
set -eux

SWAPUUID="$(/sbin/blkid -o value -l -s UUID -t TYPE=swap)"
case "$?" in
    2|0) ;;
    *) exit 1 ;;
esac

echo '==> Clear out swap and disable until reboot'
if [ "x${SWAPUUID}" != "x" ]; then
    # Whiteout the swap partition to reduce box size
    # Swap is disabled till reboot
    SWAPPART="$(readlink -f "/dev/disk/by-uuid/${SWAPUUID}")"
    /sbin/swapoff "${SWAPPART}"
    dd if=/dev/zero of="${SWAPPART}" bs=1M || echo "dd exit code $? is suppressed"
    /sbin/mkswap -U "${SWAPUUID}" "${SWAPPART}"
fi

dd if=/dev/zero of=/EMPTY bs=1M || echo "dd exit code $? is suppressed"
rm -f /EMPTY
# Block until the empty file has been removed, otherwise, Packer
# will try to kill the box while the disk is still full and that's bad
sync
