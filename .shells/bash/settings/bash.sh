export PS1="[\\u@\\h \\w]{\\!}\$ "
export HISTTIMEFORMAT="%F %H:%M "
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTIGNORE="&:ls:ll:la:pwd:exit:clear"
export PROMPT_DIRTRIM=3

shopt -s nocaseglob
shopt -s autocd
shopt -s cmdhist
shopt -s dirspell
shopt -s dotglob
shopt -s histappend
shopt -s checkwinsize

# Dont wait for job termination notification
set -o notify

# Navigate history with up/down arrow
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion >/dev/null 2>&1

export GIT_PROMPT_ONLY_IN_REPO=1
export GIT_PROMPT_FETCH_REMOTE_STATUS=0
[[ -s ~/.bash-git-prompt/gitprompt.sh ]] && source ~/.bash-git-prompt/gitprompt.sh

# Colors
[ -x .config/base16-shell/scripts/base16-default-dark.sh ] && .config/base16-shell/scripts/base16-default-dark.sh

# Pinguin
# function show_err(){
#   ret=$?
#   echo "return code $ret" | cowsay -f tux | toilet -f term --gay
#   return $ret
# }

# trap 'show_err' ERR
