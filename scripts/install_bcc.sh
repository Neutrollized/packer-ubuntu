#!/bin/bash
# https://www.iovisor.org
# https://github.com/iovisor/bcc/blob/master/INSTALL.md#ubuntu---binary
set -eux

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D4284CDD

echo "deb https://repo.iovisor.org/apt/xenial xenial main" | sudo tee /etc/apt/sources.list.d/iovisor.list

apt-get update

apt-get install -y bcc-tools libbcc-examples linux-headers-$(uname -r)
