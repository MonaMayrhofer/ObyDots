
#/======= ZPLUG ===\=
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh, from:github, as:plugin
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug load
#\================/

#/======= ASDF ===\=
. ~/.asdf/asdf.sh
#\================/

eval "$(starship init zsh)"

alias ll="ls -lAh --color"
alias ls="ls --color"
alias lsa="ls -A --color"
alias ..="cd .."
alias ...="cd ../.."
alias gst="git status"
alias gaa="git add --all"
alias gcmsg="git commit -m"
