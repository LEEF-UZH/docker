#!/bin/bash
./run.fast.pipeline.sh
./run.bemovi.pipeline.sh
##
sudo chown -R ubuntu:ubuntu ./../LEEF/00.*
sudo chown -R ubuntu:ubuntu ./../LEEF/0.*
sudo chown -R ubuntu:ubuntu ./../LEEF/1*
sudo chown -R ubuntu:ubuntu ./../LEEF/2.*
sudo chmod -R +rx ./../LEEF/3.*
sudo chmod -R +rx ./../LEEF/9.*

echo "The pipeline on `hostname` has finished." | mail -s "LEEF-PIPELINE: all finished" -r Rainer.Krug@uzh.ch Rainer.Krug@uzh.ch