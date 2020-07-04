export GOPATH="$HOME/go"
if [[ ! ":$PATH:" =~ :${GOPATH}/bin: ]]; then
  export PATH="${GOPATH}/bin:$PATH"
fi
