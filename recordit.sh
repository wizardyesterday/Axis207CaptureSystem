#!/bin/bash

Duration=$2
NumberOfCaptures=$1
Count=0

while [ $Count -lt $NumberOfCaptures ]
do
  sh captureMpeg4.sh $Duration
#  sh captureMpeg4L.sh $Duration
  sleep 1
  let Count=Count+1
done
