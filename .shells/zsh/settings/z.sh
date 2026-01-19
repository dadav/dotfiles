if [[ -z "$DISABLE_ZOXIDE" ]]; then
  command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"
  alias cd="z"
fi
