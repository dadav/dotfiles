export KUBECONFIG=$HOME/.kube/config

if [[ ! ":$PATH:" =~ :$HOME/.krew/bin: ]]; then
  export PATH="$PATH:$HOME/.krew/bin"
fi

if [[ -d "$KUBECONFIG" ]]; then
  find "$KUBECONFIG" -name "*.yaml" -print | while read -r new_kube_config; do
    if [[ ! ":$KUBECONFIG:" =~ :$new_kube_config: ]]; then
      export KUBECONFIG="$KUBECONFIG:$new_kube_config"
    fi
  done
fi
