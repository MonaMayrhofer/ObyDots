# ======= ENABLE POWERLINE =======
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable PowerLevel10k
source ~/.ozsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ======= ENABLE SYNTAX HIGHLIGHT =========
source ~/.ozsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ======= ENABLE Z ===========

source ~/.ozsh/zsh-z/zsh-z.plugin.zsh
autoload -U compinit && compinit
zstyle ':completion:*' menu select

# ======= ENABLE K ==========
source ~/.ozsh/k/k.plugin.zsh

# ======= ENABLE GIT ==========
source ~/.ozsh/oh-my-zsh/plugins/git/git.plugin.zsh
