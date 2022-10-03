if [[ ! ":$PATH:" =~ :/usr/local/bin: ]]; then
  export PATH="/usr/local/bin:$PATH"
fi
if [[ ! ":$PATH:" =~ :${HOME}/.local/bin: ]]; then
  export PATH="${HOME}/.local/bin:$PATH"
fi
export PAGER=less
export EDITOR=nvim
export VISUAL=$EDITOR
export SYSTEMD_EDITOR=$EDITOR
export BROWSER=chromium
export GREP_COLOR='mt=1;32'
export TERM=kitty
export XDG_CURRENT_DESKTOP=sway
