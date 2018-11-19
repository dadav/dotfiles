# Create graph of systemd dependencies
function sadot() {
  if [[ $# -eq 1 ]]; then
    systemd-analyze dot "$1" 2>/dev/null | dot -Tpng | feh -
  elif [[ $# -eq 2 ]]; then
    systemd-analyze dot --from-pattern="$1" --to-pattern="$2" 2>/dev/null | dot -Tpng | feh -
  fi
}
