#!/bin/sh

#***************************************************************************
# This script captures audio using the sound card.
#
# Usage ./captureAudio.sh <duration in seconds>
#***************************************************************************

OUT="audio__$( date +%m-%0e-%G )"

#++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Ensure that there is one command line argument
#++++++++++++++++++++++++++++++++++++++++++++++++++++++
if [ $# != 1 ]
then
  echo
  echo "Usage: ./$0 <durationInSeconds"
  echo
  exit -1
fi

#*******************************************************
# If the output directory does not exist, create it.
# $? is equal to the exit status of the last command.
#*******************************************************
if [ ! -d $OUT ]
then
  mkdir $OUT
  if [ $? != 0 ]
  then
    echo "Failed to create dir: "$OUT.
    exit -2
  fi
fi

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Capture the stream.
#
# 1 minute = 60 seconds.
# 1 hour = 3600 seconds.
#
# See the man page for the date command for more info on the special
# formatting arguments that are used to construct the file name.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
wavrec -t $1 -b 8 -M -s 8000  $OUT/c$( date +%m%0e%G_%H%M%S ).wav

