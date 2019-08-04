# PreviewGrep
function pregre() {
  vim "$(rg -il "$*" | fzf --preview 'cat {}')"
}
