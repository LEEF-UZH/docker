#!/bin/bash
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
LF=log.$TS.fast.txt
touch $LF 
make run.pipeline.fast &> $LF
echo  >> $LF
echo "##################################" >> $LF
echo "## BEGIN: " $TS "##" >> $LF
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
echo "##################################" >> $LF
##
##
LF=log.$TS.bemovi.mag.25.txt
touch $LF 
# make run.pipeline.bemovi ID=mag.25 &> $LF
# echo  >> $LF
# echo "##################################" >> $LF
# echo "## BEGIN: " $TS "##" >> $LF
# echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
# echo "##################################" >> $LF
##
##
# LF=log.$TS.bemovi.mag.16.txt
# touch $LF 
# make run.pipeline.bemovi ID=mag.16 &> log.$(TS).bemovi.mag.16.txt
# echo  >> $LF
# echo "##################################" >> $LF
# echo "## BEGIN: " $TS "##" >> $LF
# echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
# echo "##################################" >> $LF
##
