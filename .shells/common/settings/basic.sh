[[ ! ":$PATH" =~ ":/usr/local/bin:" ]] && export PATH="/usr/local/bin:$PATH" || true
[[ ! ":$PATH" =~ ":${HOME}/.local/bin:" ]] && export PATH="${HOME}/.local/bin:$PATH" || true
export PAGER=less
export EDITOR=nvim
export VISUAL=$EDITOR
export SYSTEMD_EDITOR=$EDITOR
export BROWSER=chromium
export GREP_COLOR='1;32'
