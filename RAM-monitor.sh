#!/bin/bash
# I'll check whether there's a correlation between RAM and entropy pool level. I expect around 0 correlation.
while true;
do
free -m | grep Mem >> RAM-data2.txt
cat /proc/sys/kernel/random/entropy_avail >> RAM-data2.txt
sleep 5 ;
echo
done
