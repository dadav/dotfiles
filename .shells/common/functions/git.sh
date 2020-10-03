# https://github.com/mattiasgiese/dotfiles/blob/2531d36beb805b331c519f68d56653b6e349c6d3/config/zsh/functions/gcd.sh
function gcd() {
    topdir=$(git rev-parse --show-toplevel)
    if [[ $? -ne 0 ]]; then
        return 1
    fi
    cd "${topdir}/${1}"
}
