#!/bin/bash
##
SECONDS=0
##
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
## ## o2meter ##########
LF=./../LEEF/log.$TS.o2meter
LFERR=$LF.error.log
LFDONE=$LF.done.log
LF=$LF.log
# make run.pipeline.o2meter &> $LF
make run.pipeline.o2meter > >(tee -a $LF) 2> >(tee -a $LFERROR >&2)
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

##
duration=$SECONDS
echo "$(($duration / 3600)) hours, $((($duration / 60) % 60)) minutes and $(($duration % 60)) seconds elapsed."
echo "The o2meter pipeline on `hostname` has finished.

$(($duration / 3600)) hours, $((($duration / 60) % 60)) minutes and $(($duration % 60)) seconds elapsed." | \
mail \
	-s "LEEF-PIPELINE: o2meter finished" \
	-r Rainer.Krug@uzh.ch \
	Rainer.Krug@uzh.ch
	

