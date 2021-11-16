#!/bin/bash
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
LF=./../LEEF/log.$TS.fast
LFERR=$LF.error.log
LF=$LF.log
##
make run.pipeline.extract.flowcam > >(tee -a $LF) 2> >(tee -a $LFERROR >&2)
##
echo
echo "##################################" > $LF
echo "## BEGIN: " $TS "##" >> $LF
echo "## END:   " $(date '+%Y-%m-%d--%H-%M-%S')  "##" >> $LF
echo "##################################" >> $LF
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



