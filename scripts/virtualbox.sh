#!/bin/bash
set -eux

apt-get remove -y linux-headers-generic

apt-get install -y linux-headers-virtual virtualbox-guest-dkms virtualbox-guest-utils
