#!/bin/bash

find -type f -name "*.flac" -print0 | while read -d $'\0' a; do
  ffmpeg -i "$f" -qscale:a 0 "${f[@]/%flac/mp3}"
done