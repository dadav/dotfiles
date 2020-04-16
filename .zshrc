# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Check if zplug is installed
export ZPLUG_HOME="${HOME}/.zplug"
if [[ ! -d ${ZPLUG_HOME} ]]; then
  git clone https://github.com/zplug/zplug ${ZPLUG_HOME}
  source ${ZPLUG_HOME}/init.zsh && zplug update --self
else
  source ~/.zplug/init.zsh
fi

# options
setopt interactivecomments
setopt complete_aliases
setopt extendedglob


# autoload
autoload -Uz compinit zmv colors
compinit
colors

# Keybindings + Completions
bindkey -e # emacs
bindkey "^[[5~" history-beginning-search-backward # page up
bindkey "^[[6~" history-beginning-search-forward # page down
bindkey "\e[3~" delete-char # del
bindkey '^[\' pound-insert # also use setopt interactivecomments
zplug "zsh-users/zsh-autosuggestions", from:github
zplug "zsh-users/zsh-completions", from:github
zplug "junegunn/fzf", use:"shell/{key-bindings,completion}.zsh"
kitty + complete setup zsh | source /dev/stdin
compdef config="git"
compdef scripts="git"

# nav
zplug "knu/z", use:z.sh

# completion / help
zplug "zsh-users/zsh-history-substring-search"
zplug "lib/history", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh

# eyecandy
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# cmds
zplug "plugins/git", from:oh-my-zsh
zplug "junegunn/fzf", as:command, use:"bin/fzf-tmux"
zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*linux*amd64*"


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


# Sources
## Check for interactive shell, if not, return
[[ $- != *i* ]] && return

# virtualenv
. virtualenvwrapper_lazy.sh

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

# added by travis gem
[ -f /home/ddavid/.travis/travis.sh ] && source /home/ddavid/.travis/travis.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
