# Play rainsound
function rainymood() {
  FILE=$((RANDOM%4))
  URL="https://rainymood.com/audio1112/${FILE}.m4a"
  mpv --volume=70 "$URL" && rainymood
}

# Search for music and play it in random order
function fplay() {
  find ~/music/ -type f -iname "$1" -print0 -exec mpg123 -Z {} +
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
