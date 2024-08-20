echo "Installing AX.25"
echo "Removing Avahi and other bloat"
sudo dpkg -r avahi-daemon ipp-usb libnss-mdns

echo "Disable modemmanager - Breaks AX.25 serial ports"
sudo systemctl disable ModemManager.service
sudo systemctl stop ModemManager.service

echo "Disable automatic updates"
sudo systemctl disable apt-daily.timer
sudo systemctl stop apt-daily.timer
sudo systemctl disable apt-daily.service
sudo systemctl stop apt-daily.service

echo "Disable britty"
sudo systemctl stop brltty-udev.service
sudo systemctl mask brltty-udev.service
sudo systemctl stop brltty.service
sudo systemctl disable brltty.service

echo "Disable cups"
sudo systemctl disable cups-browsed.service 
sudo systemctl disable cups.service

echo "Disable triggerhappy"
sudo update-rc.d -f triggerhappy remove
sudo systemctl stop triggerhappy.socket
sudo systemctl disable triggerhappy.socket
sudo systemctl stop triggerhappy.service
sudo systemctl disable triggerhappy.service

echo "Disable rsync daemon"
sudo update-rc.d -f rsync disable

