function showmap() {
telnet mapscii.me
}

function cmdfu() {
curl "https://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext";
}

function getlast() {
	fc -ln "-${1:-10}" | sed 's/[[:space:]]*//'
}

function btrace() {
	strace $* |& vim -c ":set syntax=strace" -
}

function lsofx() {
  REMOTE=""
  PID=""
  NET=""
  UNFLAT="unflatten -l1 -c6"
  FEH_OPTS="--scale-down --auto-zoom"
  DOT_OPTS="-Goverlap=false"
  while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
      -r|--remote)
        REMOTE="$2"
        shift
        shift
        ;;
      -p|--pid)
        PID="$2"
        shift
        shift
        ;;
      -d|--disable-unflat)
        UNFLAT="cat"
        shift
        ;;
      -n|--network)
        NET="$2"
        shift
        shift
        ;;
      *)
        echo "Invalid Argument"
        exit 1
    esac
  done

  ${REMOTE:+ssh} $REMOTE sudo lsof -n -F ${NET:+-i} $NET ${PID:+-p} $PID | lsofgraph | $UNFLAT | dot $DOT_OPTS -Tpng | feh $FEH_OPTS -
}
