#!/bin/bash

#/ftp/netmon/cacti-0.8.8h/rra/igov-mm17-dnd_traffic_in_16894.rrd
cd /ftp/netmon/cacti/rra/
for i in $(ls *14342*rrd)  
do 
echo $i
cp $i /home/rod/git/rra/
rrdtool dump $i | sed "/+1/d" > /home/rod/git/rra-dump/$i.xml
#rm /ftp/netmon/cacti/rra/$i
rrdtool restore /home/rod/git/rra-dump/$i.xml /home/rod/git/rra-restored/$i
#chown www-data /ftp/netmon/cacti/rra/$i
done

