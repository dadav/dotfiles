# if [[ ! ":$PATH:" =~ :${HOME}/.rbenv/shims: ]]; then
#   export PATH="${HOME}/.rbenv/shims:$PATH"
# fi

rbenv() {
  # lazy load
  unset -f rbenv
  eval "$(rbenv init -)"
  rbenv "$@"
}
