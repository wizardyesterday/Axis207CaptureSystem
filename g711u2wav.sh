#!/bin/sh

#**********************************************************************
# File name: g711u22wav
# The purpose of this script is convert a file of G.711 mu-law PCM
# data into # a wav file.  The parameters of the input and output
# files are listed # below.
#
# Input file:
#    Sample rate: 8000 Samples/s
#    Data format: G.711 mu-law
#    Date width: 8 bits
#
# Output file:
#
#    Sample rate: 8000 Samples/s
#    Data format: Signed PCM samples (used in wav file)
#    Date width: 16 bits
#
#**********************************************************************

# Capture the audio.
sox -c 1 -v 5 -r 8000 -b -t raw -U $1 -t wav -s -w $1.wav
