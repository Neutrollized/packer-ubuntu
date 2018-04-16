#!/usr/bin/env bash
# This script cleans up a VM post-build.
# It should be run on Virtualbox and VMware base and layered Linux images.


# clean apt cache
apt-get clean

# remove old kernels
purge-old-kernels --keep 1 -y
apt-get autoremove --purge
