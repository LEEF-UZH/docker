#!/bin/bash
##
SECONDS=0
##
./run.flowcam.pipeline.sh
./run.flowcytometer.pipeline.sh
./run.manualcount.pipeline.sh
./run.o2meter.pipeline.sh
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
$(($duration / 3600)) hours, $((($duration / 60) % 60)) minutes and $(($duration % 60)) seconds elapsed." | \
mail \
	-s "LEEF-PIPELINE: fast finished" \
	-r Rainer.Krug@uzh.ch \
	Rainer.Krug@uzh.ch
	
