#!/bin/sh

ORIGIN="origin"
ENCODE="media"
FORMAT="Universal"

if [ "$1" == "SD" ]; then
	FORMAT="Normal"
fi

mkdir -p $ORIGIN
mkdir -p $ENCODE

# main loop
for i in *.MOV *.mov *.avi *.AVI; do
	[[ -e "$i" ]] || continue
	# ffmpeg2theora $i --speedlevel 0 -v 9 --croptop 4 --cropbottom 4 -a 3 --date $1 --location $2 -o encode/$i.ogv
	HandBrakeCLI -i $i -o $ENCODE/$i.mp4 -Z "$FORMAT"
	mv $i $ORIGIN
done

