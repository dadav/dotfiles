# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# options
setopt interactivecomments
setopt complete_aliases
setopt extendedglob
setopt notify
setopt appendhistory
setopt incappendhistory
setopt sharehistory

# autoload
plugins+=(zsh-completions)
autoload -Uz compinit && compinit
autoload -U colors && colors
autoload -U zmv

# keybindings + completions
bindkey -e # emacs
bindkey "^[[5~" history-beginning-search-backward # page up
bindkey "^[[6~" history-beginning-search-forward # page down
bindkey "\e[3~" delete-char # del
bindkey '^[\' pound-insert # also use setopt interactivecomments

# kitty completion; has to be after compinit
kitty + complete setup zsh | source /dev/stdin

# copy autocompletion
compdef config=git
compdef scripts=git
compdef mosh=ssh

# virtualenv
. virtualenvwrapper_lazy.sh

# source settings aliases functions
for category in aliases settings functions ; do
  for setting in $HOME/.shells/common/$category/*.sh;do
    . "$setting"
  done
  for setting in $HOME/.shells/zsh/$category/*.sh;do
    . "$setting"
  done
done

# others
for stuff in ~/{.profile,.alias}; do
  [[ -f $stuff ]] && . $stuff
done

# powerlevel10k
[[ -r '/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme' ]] \
  && source '/usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme'
[[ -r "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"

custom_plugins=(
  '/usr/share/z/z.sh'
  '/usr/share/fzf/key-bindings.zsh'
  '/usr/share/fzf/completions.zsh'
  '/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh'
  '/usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh'
  '/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
)

for plugin in $custom_plugins; do
  [[ -r "$plugin" ]] && source "$plugin"
done
