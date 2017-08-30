#
# ~/.bash_profile
#

# SSH
#export SSH_RECENT="~/.ssh/recent"                                                                                                                                                            
#Export PID- VAR                                                                                                                                                                            
#[ -f $SSH_RECENT ] && eval `cat $SSH_RECENT`                                                                                                                                                 
#RUNNING_AGENTS=0                                                                                                                                                                             
#if [ ! -z "$SSH_AGENT_PID" ]                                                                                                                                                                 
#then                                                                                                                                                                                         
#    RUNNING_AGENTS=`ps -p $SSH_AGENT_PID | grep -v CMD | wc -l`                                                                                                                              
#fi                                                                                                                                                                                           
#                                                                                                                                                                                             
#if [ $RUNNING_AGENTS -lt 1 -a $UID -ne 0 ]                                                                                                                                                   
#then                                                                                                                                                                                         
#    eval `ssh-agent`                                                                                                                                                                         
#    echo "export SSH_AGENT_PID=$SSH_AGENT_PID" > $SSH_RECENT                                                                                                                                 
#    echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" >> $SSH_RECENT                                                                                                                                
#    ssh-add                                                                                                                                                                                  
#fi           

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
export PATH="$PATH:/opt/FlameGraph/:/opt/perf-tools/bin"
# Use colors inside tmux/vim
export TERM=xterm-256color
# Python Virtualenvs
export WORKON_HOME=$HOME/python/virtualenvs
[[ -s ~/.bashrc ]] && . ~/.bashrc
