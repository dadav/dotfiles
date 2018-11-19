# Plot systemd dependencies
function sadot() {
  ARGS=""
  FEH=0
  while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
      -r|--remote)
        ARGS="$ARGS -H $2"
        shift
        shift
        ;;
      -f|--from)
        ARGS="$ARGS --from-pattern=$2"
        shift
        shift
        ;;
      -t|--to)
        ARGS="$ARGS --to-pattern=$2"
        shift
        shift
        ;;
      -o|--open)
        FEH=1
        shift
        ;;
      *)
        ARGS="$ARGS $key"
        shift
        ;;
    esac
  done
  if [[ $FEH -eq 1 ]]; then
    systemd-analyze dot $ARGS 2>/dev/null | dot -Tpng | feh -
  else
    systemd-analyze dot $ARGS 2>/dev/null | dot -Tpng > out.png
  fi
}
