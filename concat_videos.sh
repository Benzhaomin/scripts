#!/bin/sh

for i in *.MOV *.mov *.avi *.AVI; do
	[[ -e "$i" ]] || continue
	echo "file '$i'" >> file_list.txt;
done
ffmpeg -f concat -i file_list.txt -c copy full.avi
rm file_list.txt