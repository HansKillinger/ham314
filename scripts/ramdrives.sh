echo "Setting up ramdrives to preserve SD-Card"
sudo echo "tmpfs /tmp tmpfs defaults,noatime,nosuid,size=100m 0 0" | tee -a /etc/fstab
sudo echo "tmpfs /var/tmp tmpfs defaults,noatime,nosuid,size=30m 0 0" | tee -a /etc/fstab
sudo echo "tmpfs /var/log tmpfs defaults,noatime,nosuid,mode=0755,size=100m 0 0" | tee -a /etc/fstab
sudo echo "tmpfs /var/run tmpfs defaults,noatime,nosuid,mode=0755,size=2m 0 0" | tee -a /etc/fstab
sudo mount -a
df -h
