#!/usr/bin/env bash
set -x


# remove old kernels
purge-old-kernels --keep 1 -y
apt-get autoremove --purge -y

# clean apt cache
apt-get clean
