export GOPATH="$HOME/go"
[[ ! ":$PATH:" =~ ":${GOPATH}/bin:" ]] && export PATH="${GOPATH}/bin:$PATH" || true
