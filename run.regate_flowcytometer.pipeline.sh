#!/bin/bash
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
## ## fast (all but bemovi) ##########
LF=./../LEEF/log.$TS.fast
LFERR=$LF.error.txt
LFDONE=$LF.done.txt
LF=$LF.txt
# make run.pipeline.fast &> $LF
make run.pipeline.regate > >(tee -a $LF) 2> >(tee -a $LFERROR >&2)
echo
echo "##################################" > $LFDONE
echo "## BEGIN: " $TS "##" >> $LFDONE
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LFDONE
echo "##################################" >> $LFDONE
if [ -s $LFERROR ]
then
        rm -f $LFERROR
fi
##
sudo chown -R ubuntu:ubuntu ./../LEEF/00.*
sudo chown -R ubuntu:ubuntu ./../LEEF/0.*
sudo chown -R ubuntu:ubuntu ./../LEEF/1*
sudo chown -R ubuntu:ubuntu ./../LEEF/2.*
sudo chmod -R +rx ./../LEEF/3.*
sudo chmod -R +rx ./../LEEF/9.*



