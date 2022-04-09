command -v oc &>/dev/null && source <(oc completion zsh | sed -e 's/kubectl/oc/g')
