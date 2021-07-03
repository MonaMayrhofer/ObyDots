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
alias fd="fdfind"

alias coby="xclip-copyfile"
alias baste="xclip-pastefile"
alias cud="xclip-cutfile"
alias h="ghci"
alias nnvim="~/ThirdParty/nvim-nightly/nvim"
alias vi="nnvim"


if [[ -e "$HOME/.zshrc_local" ]]; then
	. $HOME/.zshrc_local
fi

export FZF_DEFAULT_COMMAND='fdfind --type f --hidden --follow --exclude .git'



# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/obyoxar/.asdf/installs/python/anaconda3-2021.05/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/obyoxar/.asdf/installs/python/anaconda3-2021.05/etc/profile.d/conda.sh" ]; then
        . "/home/obyoxar/.asdf/installs/python/anaconda3-2021.05/etc/profile.d/conda.sh"
    else
        export PATH="/home/obyoxar/.asdf/installs/python/anaconda3-2021.05/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

