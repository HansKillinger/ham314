echo 'Install WSJT-X'
cd ~/build
wget https://sourceforge.net/projects/wsjt/files/wsjtx-2.6.1/wsjtx_2.6.1_armhf.deb
sudo dpkg -i wsjtx_2.6.1_armhf.deb
sudo apt --fix-broken install -y
