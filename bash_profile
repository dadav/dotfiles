#
# ~/.bash_profile
#


export HISTTIMEFORMAT="%F %H:%M "
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTIGNORE="&:ls:ll:la:pwd:exit:clear"
export PROMPT_DIRTRIM=3

export PAGER=less
export EDITOR=vim
export VISUAL=$EDITOR
export SYSTEMD_EDITOR=$EDITOR
export PATH="$PATH:/opt/FlameGraph/:/opt/perf-tools/bin"
export TERM=xterm-256color
[[ -s ~/.bashrc ]] && . ~/.bashrc
