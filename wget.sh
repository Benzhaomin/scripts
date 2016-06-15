#!/bin/bash
# ./wget.sh http://ovh.net/files/10Mio.dat

TITLE="Downloading"
TEXT=`basename $1`

wget --user-agent="Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101 Firefox/38.0" -c $@ 2>&1 | sed -u "s/.* \([0-9]\+%\)\ \+\([0-9,.]\+.\) \(.*\)/\1\n# Downloading at \2\/s, ETA \3/" | yad --auto-kill --progress --title "$TITLE" --text "$TEXT"
