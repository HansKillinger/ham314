#!/bin/bash

#############################
# Functions
#############################
function install_direwolf(){
  echo "Installing Direwolf"
  sleep 1
  cd scripts
  bash direwolf_install.sh
  cd ..
  touch saves/ham314.direwolf
  echo "Direwolf Installed"
}

function install_hamlib(){
  echo "Installing Hamlib"
  sleep 1
  sudo dpkg -i deb/hamlib*.deb
  touch saves/ham314.hamlib
  echo "Direwolf Installed"
}

function install_flrig(){
  echo "Installing FLrig"
  sleep 1
  sudo dpkg -i deb/flrig*.deb
  touch saves/ham314.flrig
  echo "FLrig Installed"
}

####################################
# Start of script
####################################
echo ""
echo "Ham314 for Raspberry Pi OS Bookworm 64bit"
echo "Created by Bob - KD9YQK"
echo ""
sleep 1
echo -n "Checking for Ham314 Base..."
sleep 1
if [ ! -f saves/ham314.base ]; then
    echo "NOT FOUND"
    echo "Installing Ham314 Base"
    sleep 1
    echo "Backing up files"
    echo "Ham314 Base Installed"
else
    echo "OK"
fi

###################################
# Build Checklist
###################################
installed="Installed:\n"
# Direwolf
if [ ! -f saves/ham314.direwolf ]; then
    options+=(1 "Direwolf 1.8b (Built 08/22/2024)" off)
else
    options+=(1 "Direwolf 1.8b (Built 08/22/2024)" on)
    installed+="Direwolf, "
fi
# AX.25 Packet
if [ ! -f saves/ham314.ax25 ]; then
    options+=(2 "AX.25 Packet Node (Requires Direwolf)" off)
else
    options+=(2 "AX.25 Packet Node (Requires Direwolf)" on)
    installed+="AX.25 Packet Node, "
fi
# Hamlib
if [ ! -f saves/ham314.hamlib ]; then
    options+=(3 "Hamlib 4.5.5" off)
else
    options+=(3 "Hamlib 4.5.5" on)
    installed+="Hamlib 4.5.5, "
fi


#######################################
# Build dialogue box with menu options
#######################################
cmd=(dialog --backtitle "Ham314" --checklist "${installed}" 22 50 16)
choices=($("${cmd[@]}" "${options[@]}" 2>&1 1>/dev/tty))
clear
for choice in "${choices[@]}"; do
    case $choice in
        1)
            echo -n "Checking for Direwolf "
            sleep 1
            if [ ! -f saves/ham314.direwolf ]; then
                echo "NOT FOUND"
                install_direwolf
            else
                echo "OK"
            fi
            ;;
        2)
            echo -n "Checking for AX.25 "
            sleep 1
            if [ ! -f saves/ham314.ax25 ]; then
                echo "NOT FOUND"
                if [ ! -f saves/ham314.direwolf ]; then
                    echo "Direwolf NOT FOUND and is required for AX.25"
                    sleep 1
                    install_direwolf
                fi
                echo "Installing AX.25"
                sleep 1
                cd scripts
                bash ax25_install.sh
                cd ..
                touch saves/ham314.ax25
                echo "AX.25 Installed"
            else
                echo "OK"
            fi
            ;;
        3)
            echo -n "Checking for Hamlib "
            sleep 1
            if [ ! -f saves/ham314.hamlib ]; then
                echo "NOT FOUND"
                install_hamlib
            else
                echo "OK"
            fi
            ;;
    esac
done

##################################
# Cleanup
##################################
echo "Ham314 Install Complete. Enjoy!"
