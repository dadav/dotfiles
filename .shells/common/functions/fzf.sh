# PreviewGrep
function pregre() {
  F="$(rg -il "$*" | fzf --preview 'bat --style=numbers --color=always {} | head -500')"
  [[ -n "$F" ]] && nvim "$F"
}

# git branch
function fzgb() {
  B="$(git branch | fzf-tmux -d 15 | tr -d " ")"
  [[ -n "$B" ]] && git checkout "$B"
}

# select file with fzf; open with given cmd
function f() {
  F="$(fzf --preview 'bat --style=numbers --color=always {} | head -500')"
  [[ -n "$F" ]] && ${*:-nvim} "$F"
}

# open file with nvim
function fzv() {
  f nvim
}

# use fd
function _fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
function _fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
