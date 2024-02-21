# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set limit the use of system-wide resources
ulimit -S -n 4096

# Load extra files from ~./extra/.zsh/: oh-my-zsh.sh, exports.sh, aliases.sh, functions.sh, local.sh
# ~/.extra/.local can be used for settings you don’t want to commit
for file in ~/.extra/.zsh/{oh-my-zsh,exports,aliases,functions,key-bindings,local}.zsh; do
    [ -r "$file" ] && source "$file"
done
unset file

[ -f ~/.extra/.zsh/fzf/fzf.zsh ] && source ~/.extra/.zsh/fzf/fzf.zsh

eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"

# Activate powerlevel10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
