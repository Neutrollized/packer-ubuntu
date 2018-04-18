#!/bin/bash
set -eux

# remove unneeded packages
apt-get autoremove --purge -y

# clean apt cache
apt-get clean

# clean up /var/log"
find /var/log/ -type f -exec /bin/sh -c '>{}' \;
rm -f /var/log/*.old
rm -f /var/log/*.log
rm -f /var/log/*.log.*
rm -f /var/log/*.syslog
