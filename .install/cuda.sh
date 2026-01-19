#!/bin/bash

DISTRO=ubuntu2404
ARCH=x86_64

wget https://developer.download.nvidia.com/compute/cuda/repos/$DISTRO/$ARCH/cuda-keyring_1.1-1_all.deb
sudo dpkg -i cuda-keyring_1.1-1_all.deb
rm -f cuda-keyring_1.1-1_all.deb
sudo apt-get update --assume-yes
sudo apt-get install --assume-yes cuda-toolkit-12-5
sudo apt-get install --assume-yes nvidia-gds-12-5

