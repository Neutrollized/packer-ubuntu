#!/bin/bash
set -eux

# remove unneeded packages
apt-get autoremove --purge -y

# clean apt cache
apt-get clean
