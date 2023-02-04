# ls
command -v lsd &>/dev/null \
  && alias ls="lsd --group-dirs first"
alias ll="ls -lh"

# nvim
alias vi="vim"
command -v nvim &>/dev/null && alias vim"=nvim"

# grep
alias grep="grep --colour"

# less
alias less="less -r"

# keep the old file
alias gunzip="gunzip -k"
