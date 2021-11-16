#!/bin/bash
##
SECONDS=0
##
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
## ## flowcytometer ##########
LF=./../LEEF/log.$TS.flowcytometer
LFERR=$LF.error.log
LF=$LF.log
# make run.pipeline.flowcytometer &> $LF
make run.pipeline.flowcytometer > >(tee -a $LF) 2> >(tee -a $LFERROR >&2)
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

##
duration=$SECONDS
echo "$(($duration / 3600)) hours, $((($duration / 60) % 60)) minutes and $(($duration % 60)) seconds elapsed."
echo "The flowcytometer pipeline on `hostname` has finished.

$(($duration / 3600)) hours, $((($duration / 60) % 60)) minutes and $(($duration % 60)) seconds elapsed." | \
mail \
	-s "LEEF-PIPELINE: flowcytometer finished" \
	-r Rainer.Krug@uzh.ch \
	Rainer.Krug@uzh.ch
	

