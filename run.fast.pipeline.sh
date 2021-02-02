#!/bin/bash
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
## ## fast (all but bemovi) ##########
LF=./../LEEF/log.$TS.fast.txt
touch $LF 
# make run.pipeline.fast &> $LF
make run.pipeline.fast> >(tee -a $LF) 2> >(tee -a $LF.err >&2)
echo  >> $LF
echo "##################################" >> $LF
echo "## BEGIN: " $TS "##" >> $LF
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
echo "##################################" >> $LF
