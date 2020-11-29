# vim: set foldmarker={,} foldlevel=0 foldmethod=marker :
# instant prompt {
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }
# options {
setopt interactivecomments
setopt complete_aliases
setopt extendedglob
setopt notify
# }
# history {
HISTFILE=~/.cache/zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt incappendhistory
setopt sharehistory
# }
# autoload {
autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit
autoload -U colors && colors
autoload -U zmv
autoload -U history-search-end
# }
# kitty {
# has to be after compinit
kitty + complete setup zsh | source /dev/stdin
# }
# autocompletion {
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^[\' pound-insert # use alt+'#' to comment current cmdline
compinit
# }
# history {
bindkey -e # emacs
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey '^[[5~' history-beginning-search-backward-end # page up
bindkey '^[[6~' history-beginning-search-forward-end # page down
bindkey '\e[3~' delete-char # del
# }
# autosuggestion {
# press ctrl+space to use suggestion
bindkey '^ ' autosuggest-accept
# }
# virtualenv {
source virtualenvwrapper_lazy.sh
# }
# source additional configs {
for category in aliases settings functions ; do
  for config in $HOME/.shells/common/$category/*.sh;do
    source "$config"
  done
  for config in $HOME/.shells/zsh/$category/*.sh;do
    source "$config"
  done
done

# others
for stuff in ~/{.profile,.alias}; do
  [[ -f $stuff ]] && . $stuff
done
# }
# theme {
[[ -r '/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' ]] \
  && source '/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme'
[[ -r "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"
# }
# plugins {
custom_plugins=(
  '/usr/share/z/z.sh'
  '/usr/share/fzf/key-bindings.zsh'
  '/usr/share/fzf/completion.zsh'
  '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'
  '/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh'
  '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
)

for plugin in $custom_plugins; do
  [[ -r "$plugin" ]] && source "$plugin"
done
# }
# map autocompletions {
# needs to be at the end
compdef config=git
compdef scripts=git
compdef mosh=ssh
# }
# zsh profiler {
# enable if slow start
# zmodload zsh/zprof
# }
