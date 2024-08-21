echo "Install AX.25 Packet Node"
sudo dpkg -i ../deb/direwolf*.deb -y
sudo apt-get install ax25-tools ax25-node ax25-apps telnet uronode
sudo cp ../conf/ax25/* /etc/ax25
sudo touch /etc/ax25/nodebackup.sh
sudo chmod u+x /etc/ax25/nodebackup.sh
sudo echo "uronode       4444/tcp        # KD9YQK packet node" >> /etc/services
sudo echo "uronode stream tcp nowait root /usr/sbin/uronode uronode" >> /etc/inetd.conf
sudo service inetd restart
