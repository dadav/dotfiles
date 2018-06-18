export GOPATH="$HOME/go"
[[ ! ":${GOPATH}/bin:" =~ ":$PATH:" ]] && export PATH="${GOPATH}/bin:$PATH" || true
