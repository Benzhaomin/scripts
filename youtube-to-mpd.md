# what

Get songs from Youtube and play them on mpd as a http radio stream

# requirements

- youtube-dl
- mpd
- mpc

# mpd.conf

```
audio_output {
        type            "httpd"
        name            "My HTTP Stream"
        encoder         "vorbis"                # optional, vorbis or lame
        port            "9000"
        bind_to_address "0.0.0.0"               # optional, IPv4 or IPv6
        quality         "5.0"
        format          "44100:16:1"
}
```

Library:

```shell
sudo ln -s ~/music /var/lib/music/`whoami`
```

# aliases

```shell
alias youmpd='youtube-dl -q --extract-audio -o ~/music/%(title)s.%(ext)s'
alias mpdall='mpc clear && mpc listall | mpc add'
```

# adding songs

```shell
youmpd "https://www.youtube.com/watch?v=foobarsong"
mpdall
```

# listening

cvlc http://my_server:9000
