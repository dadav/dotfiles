# Play rainsound
function ambient() {
  notify-send -u normal "Loading playlist"
  mpv --profile=ambient "https://raw.githubusercontent.com/dadav/naturemood/master/playlist.m3u" &>/dev/null & disown
}

function nmp3() {
  ffmpeg-normalize "$1" -c:a libmp3lame -b:a 320k -ext mp3
}

function vidlen() {
  for vid in "$@"; do
    ffprobe -v quiet -of csv=p=0 -show_entries format=duration "$vid"
  done
}

function vidres() {
  for vid in "$@"; do
    ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of default=nw=1 "$vid"
  done
}

function ympv {
  notify-send -u normal "Playing video for \"$*\""
  (mpv ytdl://ytsearch:"$*" & disown) &>/dev/null
}
