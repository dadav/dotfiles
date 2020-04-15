alias config='/usr/bin/git --git-dir=$HOME/git/dotfiles --work-tree=$HOME'
alias scripts='/usr/bin/git --git-dir=$HOME/git/scripts --work-tree=$HOME'
alias gitlog="git log --oneline --decorate --graph --color --all"

# fzf
alias fzgb='git checkout "$(git branch | fzf-tmux -d 15 | tr -d" ")"'
