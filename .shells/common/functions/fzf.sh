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

# fuzzy ssh with ping check
function fssh() {
  TARGET="$(awk '{ print $1 }' "$HOME"/.ssh/known_hosts | tr ',' '\n' | fzf-tmux -d 10 --preview-window=top:1 --preview "nc -z {} 22 >/dev/null 2>&1 && echo status: ok || echo status: fail" | tail -n1)"
  [[ -n "$TARGET" ]] && ssh $* "$TARGET"
}

# switch to venv
function fvenv() {
  TARGET="$(lsvirtualenv -b | fzf-tmux -d 10)"
  [[ -n "$TARGET" ]] && workon "$TARGET"
}

# search thru manpages
fman() {
  FILE="$(2>/dev/null ag -l -r -z "$*" $(sed 's/:/ /g' <<<$MANPATH) | fzf --prompt 'man> ' --preview 'man {} | grep --color=always -C5 "'"$*"'"')"
  [[ -n "$FILE" ]] && man --pager "less -p \"$*\"" "$FILE"
}

# https://wiki.archlinux.org/index.php/Fzf#Arch_specific_fzf_uses
function fpac() {
  pacman -Slq | fzf -e -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
}

function fyay() {
  yay -Slq | fzf -e -m --preview 'yay -Si {1}' | xargs -ro yay -S
}

# use fd
function _fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
function _fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
