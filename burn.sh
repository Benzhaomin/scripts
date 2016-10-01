#!/bin/sh
# ./burn.sh 60

BURN=$1

echo "Going for a $BURN seconds burn"
sensors | grep 'Core'
burnP6 &
burnP6 &
burnP6 &
burnP6 &
sleep $BURN
sensors | grep 'Core'
killall burnP6
