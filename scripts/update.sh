#!/usr/bin/env bash
set -x

# install updates
apt-get install -y virtualbox-guest-dkms build-essential linux-headers-virtual
apt-get dist-upgrade -y
