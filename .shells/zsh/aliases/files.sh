# https://blog.sebastian-daschner.com/entries/zsh-aliases
# starts one or multiple args as programs in background
background() {
  for ((i=2;i<=$#;i++)); do
    ${@[1]} ${@[$i]} &>/dev/null &
  done
}

alias -s {xml,json,yml,yaml}=nvim
#alias -s {go,py,pp,sh}="background code"
alias -s html="background chromium"
alias -s {pdf,PDF}="background zathura"
alias -s {zip,ZIP}="unzip -l"
