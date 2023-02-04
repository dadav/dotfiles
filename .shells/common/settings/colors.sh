command -v dircolors &>/dev/null \
  && test -f "$HOME"/.dircolors \
  && eval "$(dircolors -b "$HOME"/.dircolors)"
