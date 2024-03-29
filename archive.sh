#!/bin/bash

usage="
Usage: `basename $0` [options]
       
Move all content in the folder 'LEEF/3.archived.data' to the container 'LEEF.archived.data'
and copy the content of the folder 'LEEF/9.backend' to the container 'LEEF.backend' 
on the S3 Swift Object Storage. The transfer uses the 'swift' command.

Options:
  -h, --help            Print short help message and exit
"

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
  echo "${usage}"
  exit 0
fi

############
############

FROM_ARCHIVED=/home/ubuntu/LEEF/3.archived.data
TO_ARCHIVE_CONTAINER=LEEF.archived.data

FROM_BACKEND=/home/ubuntu/LEEF/9.backend
TO_BACKEND_CONTAINER=LEEF.backend.data

echo
echo "FROM ARCHIVED : $FROM_ARCHIVED"
echo "TO CONTAINER  : $TO_ARCHIVE_CONTAINER"
echo
echo "FROM BACKEND : $FROM_BACKEND"
echo "TO CONTAINER : $TO_BACKEND_CONTAINER"
echo 

source /home/ubuntu/restic/swift;

echo "####################################";
echo "## uploading $FROM_ARCHIVED";
echo "####################################";
/home/ubuntu/.local/bin/swift upload \
  --changed \
  --skip-identical \
  $TO_ARCHIVE_CONTAINER \
  $FROM_ARCHIVED &&
sudo rm -rf $FROM_ARCHIVED;

echo "####################################";
echo "## uploading $FROM_BACKEND";
echo "####################################";
/home/ubuntu/.local/bin/swift upload \
  --changed \
  --skip-identical \
  $TO_BACKEND_CONTAINER \
  $FROM_BACKEND \
  --object-name LEEF.RRD.$(date +%Y-%m-%d).sqlite &&

echo "####################################";
echo "## done";
echo "####################################";
