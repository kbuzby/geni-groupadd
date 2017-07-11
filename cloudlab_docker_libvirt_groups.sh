#!/usr/bin/env bash

set -e -u 

echo "Creating docker and libvirtd groups"
groupadd -f docker
groupadd -f libvirtd

echo "Adding all users to groups"
for user in /users/*
do
  username=$(basename $user)
  echo " user: $username"
  usermod -a -G docker,libvirtd $username
done

echo "Done!"

