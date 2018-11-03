function animedl() {
  SLEEP_INT=10
  (cd ~/git/youtube-dl || exit 1 && python -m youtube_dl --sleep-interval "$SLEEP_INT" --download-archive ~/.downloaded.txt -o "$HOME/library/videos/anime/%(title)s.%(ext)s" "$@")
}
export -f animedl

# Parallel Version
function panimedl() {
  # Check if first input is a integer. If yes, use it as thread count.
  if [[ $1 =~ ^[0-9]+$ ]]; then
    THREADS=$1
    shift
  fi

  parallel --ungroup -j"${THREADS-3}" -- animedl ::: "$@"
}
