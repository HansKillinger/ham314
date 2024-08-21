#!/bin/bash
set -e  # exit on error
###############################
# Initial Setup Checks
###############################
sudo apt update
if groups $USER | grep -qw 'dialout'; then
    echo "$USER is as member of dialout group"
else
    echo 'Adding $USER to dialout group'
    sudo usermod -a -G dialout $USER
fi
if [ ! -d "$DIRECTORY" ]; then
    echo 'Creating build directory'
    mkdir ~/build -v
fi
sleep 1
bash scripts/debloat.sh
bash scripts/ramdrives.sh

#cd scripts
#for f in *.sh; do
#  bash "$f"
#done


sudo apt install hamradiomenus -y
echo 'Install Complete :)'
