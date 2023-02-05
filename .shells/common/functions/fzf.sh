

# Search package and install
function fzf_pacman_install() {
  pacman -Slq | fzf -e -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S
}

# Search aur package and install
function fzf_yay_install() {
  yay -Slq | fzf -e -m --preview 'yay -Si {1}' | xargs -ro yay -S
}

# use fd
function _fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}

function _fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}
