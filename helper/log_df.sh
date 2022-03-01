#!/bin/bash
##
SECONDS=5
##

rm -f df.log
while true; 
do  
	df -hT -x tmpfs -x devtmpfs -x vfat | awk ' {print $1 "," $2 "," $3 "," $4 "," $5 "," $6} ' >> df.log; 
	sleep $SECONDS; 
done

####
# In R
####
# read.csv("/Volumes/leef_data/LEEF/df.log") %>% select(Filesystem, Avail, Use.) %>% filter (Filesystem != "Filesystem") %>% filter(Filesystem == "/dev/vda1")
####