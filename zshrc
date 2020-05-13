autoload -U compinit && compinit
zstyle ':completion:*' menu select

source "${HOME}/.obydotrc_generated"

# ======= ENABLE POWERLINE =======
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# The following variable will be automatically set by the link script, which inputs
# the to the `obin` directory in the ObyDots directory.
export PATH="${PATH}:${HOME}/bin:${OBYDOTBINDIR}:${HOME}/.local/bin"

# ======= ENABLE TMUX =========
#ZSH_TMUX_AUTOSTART=true
source ~/.ozsh/oh-my-zsh/plugins/tmux/tmux.plugin.zsh

ENABLE_ANACONDA=false
ANACONDA_PATH="/opt/Anaconda/anaconda3/bin"
if [ -d $ANACONDA_PATH ]; then
  ENABLE_ANACONDA=true
else
  echo "Anaconda is not installed under $ANACONDA_PATH conda will not be activated in your zsh"
fi

# Enable PowerLevel10k
source ~/.ozsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ======= ENABLE SYNTAX HIGHLIGHT =========
source ~/.ozsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ======= ENABLE Z ===========
source ~/.ozsh/zsh-z/zsh-z.plugin.zsh

# ======= ENABLE K ==========
source ~/.ozsh/k/k.plugin.zsh

# ======= ENABLE GIT ==========
source ~/.ozsh/oh-my-zsh/plugins/git/git.plugin.zsh

# ======= ENABLE fzf =========
source ~/.ozsh/oh-my-zsh/plugins/fzf/fzf.plugin.zsh

# ======= ENABLE ASDF ==========
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

if test ENABLE_ANACONDA; then
# ======= ENABLE ANACONDA ========
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/Anaconda/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/Anaconda/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/Anaconda/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/Anaconda/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
fi

# ============= OWN COMMANDS =============
alias deepwhich="readlink -f $(which $1)"
alias ll="ls -la -h --color"

export PATH=$PATH:~/bin

# ======= ENABLE ASDF ==========
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# ====== FIX NPM PATH ======
# export PATH=$PATH:node_modules/.bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/obyoxar/.sdkman"
[[ -s "/home/obyoxar/.sdkman/bin/sdkman-init.sh" ]] && source "/home/obyoxar/.sdkman/bin/sdkman-init.sh"
