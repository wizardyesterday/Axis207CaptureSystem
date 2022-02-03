#!/bin/sh

#***************************************************************************
# This script captures mpeg4 a video (and audio) stream from an Axis 207W
# network camera.  An application, called openRSTP is used to capture
# the mpeg4 stream.
#
# Usage ./captureMpeg4.sh <duration in seconds>
#***************************************************************************

SNAP="openRTSP -v -n -4 -d $1 -b 1000000 rtsp://root:12345678@axisW/mpeg4/media.amp"
OUT="video__$( date +%m-%0e-%G )"

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
# See the man page for the date command for more info on the special
# formatting arguments that are used to construct the file name.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$SNAP > $OUT/$( date +%m-%0e-%G__%H-%M-%S ).mp4

