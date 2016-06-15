#!/bin/sh
# ./update_trackers.sh

# trackers:
#
# udp://9.rarbg.me:2710/announce
# udp://9.rarbg.to:2710/announce
# udp://tracker.opentrackr.org:1337/announce
# udp://tracker.coppersurfer.tk:6969/announce

for file in ~/.config/transmission/torrents/*.torrent
do
    trackers=`transmission-show "$file" | grep announce`

    # remove all trackers
    for tracker in $trackers
    do
        transmission-edit -d "$tracker" "$file"
    done

    # add default trackers
    transmission-edit -a "udp://9.rarbg.me:2710/announce" "$file"
    transmission-edit -a "udp://9.rarbg.to:2710/announce" "$file"
    transmission-edit -a "udp://tracker.opentrackr.org:1337/announce" "$file"
    transmission-edit -a "udp://tracker.coppersurfer.tk:6969/announce" "$file"
done
