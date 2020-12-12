function hibiki() {
  url="https://archive.org/details/hikibiki_podcast/${(l:3::0:)1}.mp3"
  notify-send -u normal "Playing $url"
  mpv --volume=100 --lavfi-complex='[aid1] asplit [ao] [v] ; [v] showwaves=mode=line:split_channels=1 [vo]' --force-window --no-terminal "https://archive.org/details/hikibiki_podcast/${(l:3::0:)1}.mp3" &!
}
