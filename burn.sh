#!/bin/sh
# ./burn.sh 60

BURN=$1

echo "Going for a $BURN seconds burn"
psensor 2>/dev/null &
sensors | grep 'Core 0'
burnP6 &
burnP6 &
burnP6 &
burnP6 &
sleep $BURN
sensors | grep 'Core 0'
killall burnP6
