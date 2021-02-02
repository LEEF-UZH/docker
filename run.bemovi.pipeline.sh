#!/bin/bash
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
## ## bemovi.mag/.25 ###################
LF=./../LEEF/log.$TS.bemovi.mag.25
LFERR=$LF.error.txt
LFDONE=$LF.error.txt
LF=$LF.txt
make run.pipeline.bemovi ID=mag.25 > >(tee -a $LF) 2> >(tee -a $LFERR >&2)
echo  >> $LF
echo "##################################" >> $LFDONE
echo "## BEGIN: " $TS "##" >> $LFDONE
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LFDONE
echo "##################################" >> $LFDONE
##
##
## ## bemovi.mag/.16 ###################
LF=./../LEEF/log.$TS.bemovi.mag.16
LFERR=$LF.error.txt
LFDONE=$LF.error.txt
LF=$LF.txt
make run.pipeline.bemovi ID=mag.16 > >(tee -a $LF) 2> >(tee -a $LFERR >&2)
echo  >> $LF
echo "##################################" >> $LFDONE
echo "## BEGIN: " $TS "##" >> $LFDONE
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LFLFDONE
echo "##################################" >> $LFLFDONE
##
