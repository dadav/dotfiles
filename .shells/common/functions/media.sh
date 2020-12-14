function ambient() {
  if [[ "$#" -eq 1 ]]; then
    notify-send -u normal "Loading rainymood sounds"
    mpv --profile=ambient https://rainymood.com/audio1112/{0..4}.ogg &>/dev/null & disown
  else
    notify-send -u normal "Loading playlist with random ambient sounds"
    mpv --profile=ambient "https://raw.githubusercontent.com/dadav/naturemood/master/playlist.m3u" &>/dev/null & disown
  fi
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
