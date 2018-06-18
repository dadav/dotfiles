[[ ! ":${HOME}/.local/bin:" =~ ":$PATH:" ]] && export PATH="${HOME}/.local/bin:$PATH" || true
export PAGER=less
export EDITOR=nvim
export VISUAL=$EDITOR
export SYSTEMD_EDITOR=$EDITOR
export BROWSER=firefox
export GREP_COLOR='1;32'
