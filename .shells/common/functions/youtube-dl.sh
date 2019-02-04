function animedl() {
  SLEEP_INT=10
  (cd ~/git/youtube-dl || exit 1 && python -m youtube_dl --socket-timeout 60 --retries infinite --sleep-interval "$SLEEP_INT" --download-archive ~/.downloaded.txt -o "$HOME/library/videos/anime/%(title)s.%(ext)s" "$@")
}

#export -f animedl
#
## Parallel Version
#function panimedl() {
#  FAIL=3
#  # Check if first input is a integer. If yes, use it as thread count.
#  if [[ $1 =~ ^[0-9]+$ ]]; then
#    THREADS=$1
#    shift
#  fi
#
#  parallel --halt soon,fail="$FAIL" --ungroup -j"${THREADS-3}" -- animedl ::: "$@"
#}
