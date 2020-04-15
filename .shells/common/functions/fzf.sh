# PreviewGrep
function pregre() {
  vim "$(rg -il "$*" | fzf --preview 'bat --style=numbers --color=always {} | head -500')"
}
