umask 022

# Sources
## Check for interactive shell, if not, return
[[ $- != *i* ]] && return

## Its interactive, load aliases
# source all settings
for category in aliases settings functions ; do
  for setting in $HOME/.bash/$category/*.sh;do
    . "$setting"
  done
done

### OTHER FILES
for stuff in ~/{.profile,.alias,.bash_secrets}; do
  [[ -f $stuff ]] && . $stuff
done

# added by travis gem
[ -f /home/ddavid/.travis/travis.sh ] && source /home/ddavid/.travis/travis.sh
