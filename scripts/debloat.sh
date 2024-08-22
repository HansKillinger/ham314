echo "Disable unused services"
sleep 1
echo "Disable Avahi"
sleep 1
sudo systemctl disable avahi-daemon
sudo systemctl stop avahi-daemon
sudo systemctl stop avahi-daemon.socket
echo "Disable modemmanager - Breaks AX.25 serial ports"
sleep 1
sudo systemctl disable ModemManager.service
sudo systemctl stop ModemManager.service
echo "Disable automatic updates"
sleep 1
sudo systemctl disable apt-daily.timer
sudo systemctl stop apt-daily.timer
sudo systemctl disable apt-daily.service
sudo systemctl stop apt-daily.service
echo "Disable britty"
sleep 1
sudo systemctl stop brltty-udev.service
sudo systemctl mask brltty-udev.service
sudo systemctl stop brltty.service
sudo systemctl disable brltty.service
echo "Disable cups"
sleep 1
sudo systemctl disable cups-browsed.service 
sudo systemctl disable cups.service
echo "Disable triggerhappy"
sleep 1
sudo update-rc.d -f triggerhappy remove
sudo systemctl stop triggerhappy.socket
sudo systemctl disable triggerhappy.socket
sudo systemctl stop triggerhappy.service
sudo systemctl disable triggerhappy.service
echo "Disable rsync daemon"
sleep 1
sudo update-rc.d -f rsync disable
echo "Debloat complete"
sleep 1
