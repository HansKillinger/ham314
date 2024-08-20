#!/bin/bash

echo 'Adding user to dialout'
sudo usermod -a -G dialout $USER

echo 'Attempting to create build directory'
mkdir ~/build -v

set -e  # exit on error
cd scripts
for f in *.sh; do
  bash "$f"
done

sudo apt install hamradiomenus -y

cd ~
echo 'Install Complete :)'
