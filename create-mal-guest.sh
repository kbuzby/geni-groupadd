#!/usr/bin/env bash

set -e -u

echo "Starting malicious guest"
pushd ~/contrib/kvm-install-vm
sudo ./kvm-install-vm create -m 8192 -t ubuntu1804 malguest
popd
