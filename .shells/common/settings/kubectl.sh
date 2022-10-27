export KUBECONFIG=$HOME/.kube/config

if [[ ! ":$PATH:" =~ :$HOME/.krew/bin: ]]; then
  export PATH="$PATH:$HOME/.krew/bin"
fi

fd . -a -e .yaml "$HOME"/.kube/configs/ | while read -r new_kube_config; do
  if [[ ! ":$KUBECONFIG:" =~ :$new_kube_config: ]]; then
    export KUBECONFIG="$KUBECONFIG:$new_kube_config"
  fi
done
