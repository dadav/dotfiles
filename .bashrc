umask 022

# Sources
## Check for interactive shell, if not, return
[[ $- != *i* ]] && return
## Its interactive, load aliases
[[ -s ~/.alias ]] && source ~/.alias

## Load .profile
#[[ -f ~/.profile ]] && source ~/.profile

# Prompt
# PS1='[\u@\h \W]\$ '
## Show number of command in prompt
export PS1="[\\u@\\h \\w]{\\!}\$ "

## Activate bash-completion
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    source /usr/share/bash-completion/bash_completion >/dev/null 2>&1

## Anki fix
export QTWEBENGINE_DISABLE_SANDBOX=1

## Activate gitprompt
export GIT_PROMPT_ONLY_IN_REPO=1
export GIT_PROMPT_FETCH_REMOTE_STATUS=0
[[ -s ~/.bash-git-prompt/gitprompt.sh ]] && source ~/.bash-git-prompt/gitprompt.sh

## Colors
[ -x .config/base16-shell/scripts/base16-default-dark.sh ] && .config/base16-shell/scripts/base16-default-dark.sh

# Languages
## Pythonenvs
[[ -s $HOME/.local/bin/virtualenvwrapper.sh ]] && source $HOME/.local/bin/virtualenvwrapper.sh

# Bash options
#shopt -s nocaseglob
#shopt -s autocd
shopt -s cmdhist
#shopt -s dirspell
#shopt -s dotglob
shopt -s histappend
shopt -s checkwinsize
#set -o notify

## Activate dircolors
eval "$(dircolors -b "$HOME"/.dircolors)"
