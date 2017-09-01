#
# ~/.bash_profile
#

# History
export HISTTIMEFORMAT="%F %H:%M "
export HISTCONTROL=ignoredups
export HISTSIZE=5000
export HISTIGNORE="&:ls:ll:la:pwd:exit:clear"
export PROMPT_DIRTRIM=3

# Editors
export PAGER=less
export EDITOR=vim
export VISUAL=$EDITOR
export SYSTEMD_EDITOR=$EDITOR
# Path stuff
export PATH="$HOME/.local/bin:/home/ddavid/.gem/ruby/2.4.0/bin:/opt/FlameGraph:/opt/perf-tools/bin:$PATH"
# Use colors inside tmux/vim
export TERM=xterm-256color
# Python Virtualenvs
export WORKON_HOME=$HOME/python/virtualenvs
# Add autocomplete to virtualenv
export PYTHONSTARTUP=$HOME/.pythonrc.py
[[ -s ~/.bashrc ]] && . ~/.bashrc
