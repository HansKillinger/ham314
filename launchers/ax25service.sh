#!/bin/bash -x
# trap ctrl-c and call ctrl_c()
trap ctrl_c INT
trap ctrl_c TERM
function ctrl_c() {
   sudo nodesave /etc/ax25/nodebackup.sh
   sudo killall mheardd
   sudo killall ax25d
   sudo killall kissattach
   sudo killall direwolf
   exit 0
}

sudo killall mheardd
sudo killall ax25d
sudo killall kissattach
sudo killall direwolf

# zero out old direwolf log file in case /tmp/ is full
truncate --size 0 /tmp/direwolf.log

sudo -u kd9yqk direwolf -t 0 -c /home/kd9yqk/direwolf-node.conf -p > /tmp/direwolf.log &

sleep 5
nrdevice=`ifconfig | grep nr0 | wc -l`
if [ $nrdevice -eq 0 ]; then
   sudo modprobe netrom
   sudo nrattach netrom  # run this once per boot
fi

sudo kissattach `ls -l /tmp/kisstnc | awk '{ print $11 }'` ax0

sudo kissparms -c 1 -p ax0  # fix invalid port first to tries on direwolf
sudo ax25d
sudo /etc/ax25/nodebackup.sh
sudo /usr/sbin/netromd
sudo mheardd

# backup node data hourly
while true; do
   sleep 1200
   sudo nodesave /etc/ax25/nodebackup.sh
done
