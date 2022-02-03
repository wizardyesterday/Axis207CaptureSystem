#!/bin/sh

#**********************************************************************************
# This script will grab an image from an Axis 207W camera every 'time' seconds.
# usage: ./capture NumberOfCaptures SleepTime
#
# Snapshots are teken with the file name format, mm-dd-yyyy__hh-mm-ss.jpg.
# The fields are,
# mm: The two digit month (01 - 12)
# dd: The two digit day (01-31)
# yyyy: The 4 digit year
# hh: The two digit hour (00 - 23)
# mm: The two digit minute (00 - 59)
# ss: The two digit second (00 - 59)
#
# Note: The original script was obtained from.
# http://fabiobaltieri.com/2012/07/13/making-time-lapse-video-with-ip-cameras/
#**********************************************************************************

# NOTE: replace user, password and camera-address with the actual values
#SNAP="wget -nv http://user:password@camera-address/axis-cgi/jpg/image.cgi"
SNAP="wget -nv http://root:12345678@axisW/axis-cgi/jpg/image.cgi?resolution=320x240"
OUT=image_$( date +%m-%0e-%G )

#++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Ensure that there is onecommand line argument
#++++++++++++++++++++++++++++++++++++++++++++++++++++++
if [ $# != 2 ]
then
  echo
  echo "Usage: ./$0 <NumberOfCaptures> <SleepTime>"
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

#++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Copy the command line arguments.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++
NumberOfCaptures=$1
SleepTime=$2

#++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Initial count of 0.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++
let Counter=0

#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# Capture the images.
# See the man page for the date command for more info on the special
# formatting arguments that are used to construct the file name.
#++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
while [ $Counter -lt $NumberOfCaptures ] ; do
  $SNAP -O $OUT/$( date +%m-%0e-%G__%H-%M-%S ).jpg
  sleep $SleepTime
  let Counter=Counter+1
done

echo
echo "//////////////////////////////////////"
echo $Counter "image(s)" captured.
echo "//////////////////////////////////////"

