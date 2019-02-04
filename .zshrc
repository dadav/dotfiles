# Check if zplug is installed
export ZPLUG_HOME="${HOME}/.zplug"
if [[ ! -d ${ZPLUG_HOME} ]]; then
  git clone https://github.com/zplug/zplug ${ZPLUG_HOME}
  source ${ZPLUG_HOME}/init.zsh && zplug update --self
else
  source ~/.zplug/init.zsh
fi

#zplug "agnoster/agnoster-zsh-theme", use:agnoster.zsh-theme, from:github, as:theme, hook-build: "sed -e '/#/!s/.*prompt_context/#&/g' -i agnoster.zsh-theme"
zplug "plguins/z", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plguins/command-not-found", from:oh-my-zsh
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-completions", from:github
zplug "$HOME/.config/zsh/themes/", from:local, use:"agnoster.zsh-theme", as:theme

# Install packages that have not been installed yet
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    else
        echo
    fi
fi

zplug load

# Bindkeys
bindkey -e # reset
bindkey "^[[5~" history-beginning-search-backward # page up
bindkey "^[[6~" history-beginning-search-forward # page down
bindkey "\e[3~" delete-char # del

# Sources
## Check for interactive shell, if not, return
[[ $- != *i* ]] && return

## Its interactive, load aliases
# source all settings
for category in aliases settings functions ; do
  for setting in $HOME/.shells/common/$category/*.sh;do
    . "$setting"
  done
  for setting in $HOME/.shells/zsh/$category/*.sh;do
    . "$setting"
  done
done

### OTHER FILES
for stuff in ~/{.profile,.alias}; do
  [[ -f $stuff ]] && . $stuff
done
