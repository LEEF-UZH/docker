#!/bin/bash
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
## ## bemovi.mag/.25 ###################
LF=./../LEEF/log.$TS.bemovi.mag.25
make run.pipeline.bemovi ID=mag.25 > >(tee -a $LF.txt) 2> >(tee -a $LF.error.txt >&2)
echo  >> $LF
echo "##################################" >> $LF
echo "## BEGIN: " $TS "##" >> $LF
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
echo "##################################" >> $LF
##
##
## ## bemovi.mag/.16 ###################
LF=./../LEEF/log.$TS.bemovi.mag.16
make run.pipeline.bemovi ID=mag.16 > >(tee -a $LF.txt) 2> >(tee -a $LF.error.txt >&2)
echo  >> $LF
echo "##################################" >> $LF
echo "## BEGIN: " $TS "##" >> $LF
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
echo "##################################" >> $LF
##
