TRAPALRM() {
    if [ "$WIDGET" != "expand-or-complete" ]; then
        zle reset-prompt
    fi
}
TMOUT=1
