"""
usage:

# playlist
python3 deuxminutes.py > playlist.txt

# download with parallel + wget
cat playlist.txt | sed -e 's/^/wget -nc -nv /' | parallel -j 8

# or just with plain wget
cat playlist.txt | xargs wget
"""

import urllib.request
import xml.etree.ElementTree as ET

ROOT_URL = 'http://www.les2minutesdupeuple.fr'
PLAYLIST_URL = ROOT_URL + '/les2minutesdupeuple.xml'
FILES_URL = ROOT_URL + '/s_les2minutesdupeuple/'

if __name__ == "__main__":
    with urllib.request.urlopen(PLAYLIST_URL) as response:
        playlist = response.read()
        xml = ET.fromstring(playlist)

    rank = 0
    for node in xml.iter('sound'):
        rank += 1
        title = node.find('titre').text.replace('"', '')
        file_url = FILES_URL + node.find('mp3').text
        print('{} -O "{:03d}. {}.mp3"'.format(file_url, rank, title))
