# Print all but last line of loginshell sources
function bashvars() {
  PS4='+$BASH_SOURCE ' BASH_XTRACEFD=7 bash -xlic "exit 0" 2>&1 7>&2 >/dev/null
}

# Transforms bash xtracefd to dot
function bashdot() {
  SHOWVAR=""
  SHOWDATA=""
  REMOTE=""
  while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
      -r|--remote)
        REMOTE="$2"
        shift
        shift
        ;;
      -v|--variables)
        SHOWVAR=1
        shift
        ;;
      -d|--data)
        SHOWDATA=1
        shift
        ;;
      *)
        echo "Invalid Argument"
        return
        ;;
    esac
  done

  if [[ -n "$REMOTE" ]]; then
    ssh -T "$REMOTE" <<EOF | sed -ne '/digraph bash/,$ p'
      $(typeset -f bashvars)
      $(typeset -f bashdot)
      bashdot ${SHOWVAR:+-v} ${SHOWDATA:+-d}
EOF
    return
  fi

awk -v showvar="$SHOWVAR" -v showdata="$SHOWDATA" 'BEGIN {
      print "digraph bash {"
      lastplus = 1;
      c = 1;
    }

    {
      if ( $0 !~ /^\++\// ) {
        next;
      }

      path = $1;
      type = $2;
      $1 = "";
      $2 = "";
      data = $0;

      split(path, dummy, "/");
      plus = length(dummy[1]);
      path = substr(path,plus + 1);

      if ( type == "export" && (showvar || showdata)) {
        if ( ! showdata) {
          split(data, dummy, "=");
          data = dummy[1];
        }
        
        print "\""data"\" [fillcolor=cyan style=filled];";
        print "\""path"\"->\""data"\" [color=red];";
      }

      if ( path == last[plus]) {
        last[plus] = path;
        lastplus = plus;
        next;
      };

      if ( plus > lastplus && path != last[lastplus] || plus < lastplus) {
        print "\""last[lastplus]"\"->\""path"\" [label=\""c"\"];";
        c++;
      }

      last[plus] = path;
      lastplus = plus;
    }

    END {
      print "}"
    }' <(bashvars)
}
