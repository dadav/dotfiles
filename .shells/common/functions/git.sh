# Jump to root dir of git repo
function git_root() {
    local topdir
    topdir=$(git rev-parse --show-toplevel)
    if [[ -z $topdir ]]; then
        return 1
    fi
    cd "${topdir}" || return 1
}
