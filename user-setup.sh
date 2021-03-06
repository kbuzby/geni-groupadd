#!/usr/bin/env bash

set -e -u 

echo "Creating docker and libvirtd groups"
sudo groupadd -f docker
sudo groupadd -f libvirtd

echo "Adding all users to groups"
for user in /users/*
do
  username=$(basename $user)
  echo " user: $username"
  sudo usermod -a -G docker,libvirtd,libvirt,libvirt-qemu $username
done

echo "Generating ssh key"
ssh-keygen -t rsa -f ~/.ssh/id_rsa -q -N ""

echo "Checking out setup scripts"
mkdir -p ~/contrib
git clone https://github.com/kbuzby/kvm-install-vm.git ~/contrib/kvm-install-vm

echo "Starting guests"
pushd ~/contrib/kvm-install-vm

echo "Starting MalOS"
sudo ./kvm-install-vm create -m 8192 -t ubuntu1804 malguest

echo "Starting innocents"
sudo ./kvm-install-vm create -m 8192 -t ubuntu1804 ubuntu1
popd

echo "Done!"

