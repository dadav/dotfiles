
function animedl() {
  SLEEP_INT=10
  (cd ~/git/youtube-dl || exit 1 && python -m youtube_dl --sleep-interval "$SLEEP_INT" --download-archive ~/.downloaded.txt "$HOME/library/videos/anime/%(id)s/%(title)s.%(ext)s" "$@")
}
