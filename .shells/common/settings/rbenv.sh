if [[ ! ":$PATH" =~ :${HOME}/.rbenv/shims: ]]; then
  export PATH="${HOME}/.rbenv/shims:$PATH"
fi
eval "$(rbenv init -)"
