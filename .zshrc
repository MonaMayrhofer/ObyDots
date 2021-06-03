fpath+=~/.zfunc

#/======= ZPLUG ===\=
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh, from:github, as:plugin
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "agkozak/zsh-z", from:github
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

alias coby="xclip-copyfile"
alias baste="xclip-pastefile"
alias cud="xclip-cutfile"
alias h="ghci"



if [[ -e "$HOME/.zshrc_local" ]]; then
	. $HOME/.zshrc_local
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'


# alias cat="echo \"NOPE. Let's use 'batcat (bat)' pls\ncat: \" && cat $@"
# alias bat="batcat"
# alias ls="echo \"NOPE. Let's use 'exa (x)' pls\nls: : \" && ls $@"
# alias x="exa"
# alias xx="exa -l"
# alias find="echo \"NOPE. Let's use 'fd' pls\n find: \" && find $@"
# alias ps="echo \"NOPE. Let's use 'procs'\n ps:: \" && ps $@"
# alias top="echo \"NOPE. Let's use 'bottom (btm)'\n ps:: \" && top $@"
# alias cd="echo \"NOPE. Let's use 'zoxide (z)'\n cd:: \" && cd $@" #zoxide
# 
# eval "$(zoxide init zsh)"
