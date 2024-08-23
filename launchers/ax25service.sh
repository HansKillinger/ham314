#!/bin/bash -x
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT
trap ctrl_c TERM
function ctrl_c() {
   echo "CTRL-C pressed, killing direwolf in winlinke mode"
   sudo killall direwolf
   sudo killall kissattach
   sudo killall ax25d
   sudo killall -9 direwatch.py
   exit 0
}

sudo killall kissattach

# zero out old direwolf log file in case /run/ is full
truncate --size 0 /run/direwolf.log

direwolf -d t -p -q d -t 0 -c /run/direwolf.node.conf | tee /home/pi/direwolf.log &

sleep 5
sudo modprobe netrom
nrdevice=`ifconfig | grep nr0 | wc -l`
if [ $nrdevice -eq 0 ]; then
  sudo nrattach netrom  # run this once per boot
fi

#if [ -n "$WINLINKALSO" ]; then
#  sudo kissattach `ls -l /tmp/kisstnc | awk '{ print $11 }'` radio 44.56.4.222 # set IP, which makes winlink advertise
#else
#  sudo kissattach `ls -l /tmp/kisstnc | awk '{ print $11 }'` radio             # do not set IP, no winlink advertisement
#fi

sudo kissparms -c 1 -p radio  # fix invalid port first to tries on direwolf
sudo ax25d  # for rmsgw only
sudo /etc/ax25/nodebackup.sh  # restore node table and routes we heard last time
sudo /usr/sbin/netromd        # Start the netrom service, lists for nodes/routes
#sudo route del -net 44.0.0.0 netmask 255.0.0.0  # kill tcp traffic to ax0, updatesysop.py hits api.winlink.org on net 44

# advertise node on aprs.fi
while true; do
  sleep 1200
done
