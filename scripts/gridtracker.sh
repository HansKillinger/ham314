echo 'Install Grid Tracker'
cd ~/build
curl  https://debian.gridtracker.org/gridtracker_deb_install.sh | sudo bash
sudo apt-get update
sudo apt-get install gridtracker
