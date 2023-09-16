# https://blog.sebastian-daschner.com/entries/zsh-aliases
# starts one or multiple args as programs in background
background() {
  for ((i=2;i<=$#;i++)); do
    ${@[1]} ${@[$i]} &>/dev/null &
  done
}

# file associations
alias -s {xml,json,yml,yaml}=nvim
alias -s html="background chromium"
alias -s {pdf,PDF}="background zathura"
alias -s {zip,ZIP}="unzip -l"

# newest directory
alias -g ND='*(/om[1])'
# newest file
alias -g NF='*(.om[1])'
# 10 biggest files
alias -g BF10='*(.OL[1,10])'
# 10 last modified files
alias -g OF10='*(.Om[1,10])'

# recursive versions of previous aliases
alias -g NDR='**/*(/om[1])'
alias -g NFR='**/*(.om[1])'
alias -g BF10R='**/*(.OL[1,10])'
alias -g OF10R='**/*(.Om[1,10])'
