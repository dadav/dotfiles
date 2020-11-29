if [[ ! ":$PATH" =~ :${HOME}/.rbenv/shims: ]]; then
  export PATH="${HOME}/.rbenv/shims:$PATH"
fi

rbenv() {
  eval "$(rbenv init -)"
  rbenv "$@"
}
