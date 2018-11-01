
function animedl() {
  SLEEP_INT=10
  python -m ~/git/youtube-dl/youtube_dl --sleep-interval "$SLEEP_INT" --download-archive ~/.downloaded.txt "$HOME/library/videos/anime/%(id)s/%(title)s.%(ext)s" "$@"
}
