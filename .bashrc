umask 022

# Sources
## Check for interactive shell, if not, return
[[ $- != *i* ]] && return

## Its interactive, load aliases
# source all settings
for category in aliases settings functions completions; do
  for setting in $HOME/.shells/common/$category/*.sh;do
    . "$setting"
  done
  for setting in $HOME/.shells/bash/$category/*.sh;do
    . "$setting"
  done
done

### OTHER FILES
for stuff in ~/{.profile,.alias,.bash_secrets}; do
  [[ -f $stuff ]] && . $stuff
done

# starship
command starship &>/dev/null && eval "$(starship init bash)"
