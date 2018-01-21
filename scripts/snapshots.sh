#!/bin/sh
#
DIR=$(dirname "${2}")
mkdir -p $DIR
rm $2
#
while ! test -d $2
do
    /usr/bin/avconv -i rtsp://$1:554/ch0.h264 -ss 0:0:2 -frames 2 $2
    /usr/bin/avconv -i rtsp://$1:554/live/ch00_0 -ss 0:0:2 -frames 2 $2
    ((c++)) && ((c==3)) && break
    sleep 1
done
#
#
# EOF
