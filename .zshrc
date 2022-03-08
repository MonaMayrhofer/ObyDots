fpath+=~/.zfunc

source /etc/profile

#/======= ZPLUG ===\=
source /usr/share/zsh/scripts/zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions", use:zsh-autosuggestions.zsh, from:github, as:plugin
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# zplug "agkozak/zsh-z", from:github
 zplug load
#\================/

source ~/.obydots/lib/zsh-styles.zsh

#/======= ASDF ===\=
source /opt/asdf-vm/asdf.sh
#\================/

export VISUAL=lvim

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias ll="ls -lAh --color"
alias ls="ls --color"
alias lsa="ls -A --color"
alias ..="cd .."
alias ...="cd ../.."
alias gst="git status"
alias gaa="git add --all"
alias gcmsg="git commit -m"
alias gl="git log --graph --oneline --all --decorate"
alias gd="git diff"
alias gds="git diff --staged"
alias x="exa -l"
alias xa="exa -la"

alias coby="xclip-copyfile"
alias baste="xclip-pastefile"
alias cud="xclip-cutfile"
alias h="ghci"
alias lv="lvim"
alias vi="lvim"
alias lg="lazygit"
alias kd="kitty --detach"


if [[ -e "$HOME/.zshrc_local" ]]; then
	. $HOME/.zshrc_local
fi

export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='
  --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 
  --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 
  --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
  --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4
	--preview="bat --color=always -u --style=numbers {}"
'

#Enable ZSH History
export HISTFILE=~/.local/share/zsh/zsh_history
export SAVEHIST=3000
export HISTSIZE=2000
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# Should be fixed by installing the terminfo extension for "xterm-kitty"
# source ~/.obydots/zshrc_keyfix.zsh

# VIM IN ZSH WHUWW
bindkey -v
export KEYTIMEOUT=1
