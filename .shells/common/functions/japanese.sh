function hibiki() {
  num="$(printf "%03d" "$1")"
  url="https://archive.org/details/hikibiki_podcast/${num}.mp3"
  notify-send -u normal "Playing Hibiki: ${num}"
  (mpv --profile=podcast "$url" & disown) &>/dev/null
}
