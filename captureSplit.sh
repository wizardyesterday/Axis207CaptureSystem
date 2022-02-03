#!/bin/sh

#***************************************************************************
# This script captures mpeg4 a video (and audio) stream from an Axis 207W
# network camera.  An application, called openRSTP is used to capture
# the mpeg4 stream.
#
# Usage ./captureSplit.sh <duration in seconds>
#***************************************************************************

SNAP="openRTSP -n -d $1 -b 1000000 rtsp://root:12345678@axisW/mpeg4/media.amp"

#++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Ensure that there are two command line arguments
#++++++++++++++++++++++++++++++++++++++++++++++++++++++
if [ $# != 1 ]
then
  echo
  echo "Usage: ./$0 <durationInSeconds"
  echo
  exit -1
fi

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Capture the stream.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
$SNAP

