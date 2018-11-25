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
ssh-keygen -t rsa

echo "Done!"

