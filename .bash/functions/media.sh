# Play rainsound
function rainymood() {
  FILE=$((RANDOM%4))
  URL="https://rainymood.com/audio1110/${FILE}.ogg"
  mpv "$URL" && rainymood
}

# Search for music and play it in random order
function fplay() {
  find ~/music/ -type f -iname "$1" -print0 -exec mpg123 -Z {} +
}
