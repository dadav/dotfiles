# ls
command -v lsd &>/dev/null &&
	alias ls="lsd --group-dirs first"
alias ll="ls -lh"

# nvim
alias vi="vim"
if command -v nvim &>/dev/null; then
	alias vim="nvim"
	alias n="nvim"
fi
command -v neovide &>/dev/null && alias nv="neovide"

# grep
alias grep="grep --colour"

# less
alias less="less -r"

# keep the old file
alias gunzip="gunzip -k"
