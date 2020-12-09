#!/bin/bash
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
## ## fast (all but bemovi) ##########
LF=./../LEEF/0.raw.data/log.$TS.fast.txt
touch $LF 
make run.pipeline.fast &> $LF
echo  >> $LF
echo "##################################" >> $LF
echo "## BEGIN: " $TS "##" >> $LF
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
echo "##################################" >> $LF
##
##
## ## bemovi.mag/.25 ###################
LF=./../LEEF/0.raw.data/log.$TS.bemovi.mag.25.txt
touch $LF 
make run.pipeline.bemovi ID=mag.25 &> $LF
echo  >> $LF
echo "##################################" >> $LF
echo "## BEGIN: " $TS "##" >> $LF
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
echo "##################################" >> $LF
##
##
## ## bemovi.mag/.25 ###################
LF=./../LEEF/0.raw.data/log.$TS.bemovi.mag.16.txt
touch $LF 
make run.pipeline.bemovi ID=mag.16 &> $LF
echo  >> $LF
echo "##################################" >> $LF
echo "## BEGIN: " $TS "##" >> $LF
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
echo "##################################" >> $LF
##
