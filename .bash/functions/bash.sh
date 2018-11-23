# Print all but last line of loginshell sources
function bashvars() {
  PS4='+$BASH_SOURCE ' BASH_XTRACEFD=7 bash -xlic "exit 0" 2>&1 7>&2 >/dev/null
}

# Transforms bash xtracefd to dot
function bashdot() {
awk 'BEGIN {
      print "digraph bash {"
      lastplus = 1;
      c = 1;
    }

    {
      if ( $0 !~ /^\++\// ) {
        next;
      }
      path = $1;
      split(path, dummy, "/");
      plus = length(dummy[1]);
      path = substr(path,plus + 1);

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

# Run one remote
function remotebashdot() {
  IP="$1"
  shift
  ssh -T $IP <<EOF | sed -ne '/digraph bash/,$ p'
    $(typeset -f bashvars)
    $(typeset -f bashdot)
    bashdot
EOF
}
