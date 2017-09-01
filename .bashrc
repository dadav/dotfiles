#
# ~/.bashrc
#
umask 027

# source all the stuff
[[ $- != *i* ]] && return
[[ -s ~/.alias ]] && source ~/.alias
#[[ -f ~/.profile ]] && source ~/.profile
#PS1='[\u@\h \W]\$ '
export PS1="[\u@\h \w]{\!}\$ "
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion >/dev/null 2>&1

GIT_PROMPT_ONLY_IN_REPO=1
[[ -s ~/.bash-git-prompt/gitprompt.sh ]] && source ~/.bash-git-prompt/gitprompt.sh 

# Pythonenvs
[[ -s /usr/bin/virtualenvwrapper.sh ]] && source /usr/bin/virtualenvwrapper.sh 

# bash options 
#shopt -s nocaseglob 
#shopt -s autocd 
shopt -s cmdhist 
#shopt -s dirspell 
#shopt -s dotglob 
shopt -s histappend 
shopt -s checkwinsize 
#set -o notify

eval $(dircolors -b $HOME/.dircolors)
