#!/bin/bash
##
SECONDS=0
##
TS=$(date '+%Y-%m-%d--%H-%M-%S')
##
##
## ## manualcount ##########
LF=./../LEEF/log.$TS.manualcount
LFERR=$LF.error.log
LF=$LF.log
# make run.pipeline.manualcount &> $LF
make run.pipeline.manualcount > >(tee -a $LF) 2> >(tee -a $LFERROR >&2)
echo
echo "##################################" >> $LF
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
echo "The manualcount pipeline on `hostname` has finished.

$(($duration / 3600)) hours, $((($duration / 60) % 60)) minutes and $(($duration % 60)) seconds elapsed." | \
mail \
	-s "LEEF-PIPELINE: manualcount finished" \
	-r Rainer.Krug@uzh.ch \
	Rainer.Krug@uzh.ch
	
tail -50  $LF | mail -s "LEEF-PIPELINE: manualcount finished" Rainer.Krug@uzh.ch
