
CARGO_BIN="${HOME}/.cargo/bin"

if [[ ! ":$PATH:" =~ :${CARGO_BIN}: ]]; then
  export PATH="${CARGO_BIN}:$PATH"
fi
