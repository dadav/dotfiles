# vim: set foldmarker={,} foldlevel=0 foldmethod=marker :
# fpath {
fpath=(${ASDF_DIR}/completions $fpath)
# }
# options {
setopt interactivecomments
# setopt complete_aliases
setopt extendedglob
setopt notify
setopt ignore_eof
setopt AUTO_LIST
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
autoload -U zargs
autoload -U history-search-end
unalias run-help && autoload -U run-help
# }
# kitty {
# has to be after compinit
kitty + complete setup zsh | source /dev/stdin
# }
# bindings {
bindkey -e # emacs
bindkey '\e[3~' delete-char # del
#bindkey '\C-w' kill-region # kill region not word

# history {
bindkey '^[[5~' history-substring-search-up
bindkey '^[[6~' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
# }

# autosuggestion {
bindkey '^[ ' autosuggest-accept
# }

# }
# autocompletion {
autoload -U compinit
zstyle ':completion*:default' menu 'select=0'
zmodload zsh/complist
# if matches dont fit on one page, use a pager
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# use q to exist this pager
bindkey -M listscroll q send-break
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey '^[#' pound-insert
bindkey '^[+' push-line
compinit
# }
# virtualenv {
source virtualenvwrapper_lazy.sh
# }
# source additional configs {
for category in aliases settings functions completions; do
  if [[ -d $HOME/.shells/common/$category/ ]]; then
    for config in $HOME/.shells/common/$category/*.sh;do
      source "$config"
    done
  fi
  if [[ -d $HOME/.shells/zsh/$category/ ]]; then
    for config in $HOME/.shells/zsh/$category/*.sh;do
      source "$config"
    done
  fi
done

# others
for stuff in ~/{.profile,.alias}; do
  [[ -f $stuff ]] && . $stuff
done
# }
# plugins {
plugins_dir="$HOME/.zsh/plugins"
[[ -d "$plugins_dir" ]] || mkdir -p "$plugins_dir"

additional_plugins=(
  'https://github.com/reegnz/jq-zsh-plugin'
)

for plugin in $additional_plugins; do
  plugin_path="$plugins_dir/${plugin##*/}"
  [[ -d "$plugin_path" ]] || git clone "$plugin" "$plugin_path"
  for p in "$plugin_path"/*.plugin.zsh; do
    source "$p"
  done
done

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
# plugin settings {
# zsh-syntax-highlighting {
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# better visibility
ZSH_HIGHLIGHT_PATTERNS+=('\|' fg=cyan,bold)

# potentially dangerous
ZSH_HIGHLIGHT_PATTERNS+=('rm -(r|f)## *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('sudo *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('curl * \| (b|a)#sh *' 'fg=white,bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('git push (-f|--force)# *' 'fg=white,bold,bg=red')

# makes comments visible
ZSH_HIGHLIGHT_STYLES[comment]='none'
# }
# zsh-autosuggestions {
ZSH_AUTOSUGGEST_USE_ASYNC=1
# }
# }
# map autocompletions {
# needs to be at the end
compdef config=git
compdef scripts=git
compdef mosh=ssh
compdef k=kubectl
# }
# starship {
eval "$(starship init zsh)"
# }
# zsh profiler {
# enable if slow start
# zmodload zsh/zprof
# }
