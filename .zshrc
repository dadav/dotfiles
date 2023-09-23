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
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt incappendhistory
setopt sharehistory
# cd = pushd
setopt autopushd
# dont print stack
setopt pushdsilent
# dont swap top entries
setopt pushdtohome
# swap + / -
setopt pushdminus
# }
# autoload {
autoload -Uz compinit && compinit
autoload -U bashcompinit && bashcompinit
autoload -U colors && colors
autoload -U zmv
autoload -U zargs
autoload -U history-search-end
autoload -U select-word-style
autoload -Uz edit-command-line
unalias run-help && autoload -U run-help
# }
# bindings {
bindkey -e
bindkey '\e[3~' delete-char

# start editor to edit command
# turn function into a widget and bind it to a key
zle -N edit-command-line
bindkey -M emacs '\ee' edit-command-line

# history {
bindkey '^[[5~' history-substring-search-up
bindkey '^[[6~' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
# }
# select-word-style {
# ctrl-w removes just one part of a path, not the whole path
select-word-style bash
# }
# autosuggestion {
bindkey '^[ ' autosuggest-accept
# }

# }
# autocompletion {
autoload -U compinit

# extensions for completion lists
zmodload zsh/complist

# enable menu
zstyle ':completion*:default' menu select search

# if matches dont fit on one page, use a pager
zstyle ':completion:*:default' list-prompt '%S%M matches%s'

# sort files by modification date
zstyle ':completion:*' file-sort modification

# show file details
zstyle ':completion:*' file-list all

# colorful file list
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# squash // and dont expand to /*/
zstyle ':completion:*' squeeze-slashes true

# enable partitial matching
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# enable verbose mode for completions
zstyle ':completion:*' verbose yes

# default completers
zstyle ':completion:*' completer _complete _approximate

# enable caching
zstyle ':completion:*' use-cache on

# group the completions
zstyle ':completion:*' group-name ''

# change format of the completions
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

# use q to exist this pager
bindkey -M listscroll q send-break

# use vi bindings for the menu
bindkey -M menuselect '^[' undo
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect '^n' vi-down-line-or-history
bindkey -M menuselect '^p' vi-up-line-or-history

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
  'https://github.com/hlissner/zsh-autopair'
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
  '/usr/share/doc/pkgfile/command-not-found.zsh'
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
