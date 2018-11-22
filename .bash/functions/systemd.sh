function sadot() {
  ARGS=""
  DOTOPTS="-Goverlap=false"
  FEHOPTS="--auto-scale --auto-zoom"
  OUTPUT=""
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
      -s|--save)
        OUTPUT="$2"
        shift
        shift
        ;;
      *)
        ARGS="$ARGS $key"
        shift
        ;;
    esac
  done
  if [[ -n "$OUTPUT" ]]; then
    EXT="${OUTPUT##*.}"
    systemd-analyze dot $ARGS 2>/dev/null | dot $DOTOPTS -T${EXT:-png} > ${OUTPUT%.*}.${EXT:-png}
  else
    systemd-analyze dot $ARGS 2>/dev/null | dot $DOTOPTS -Tpng | feh $FEHOPTS -
  fi
}
