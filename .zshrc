# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set limit the use of system-wide resources
ulimit -S -n 4096

# Load extra files from ~./extra/.zsh/*
# ~/.extra/.local can be used for settings you don’t want to commit
for file in ~/.extra/.zsh/{exports,aliases,functions,key-bindings,fzf,local}.zsh; do
    [ -r "$file" ] && source "$file"
done
unset file

# Activate zsh plugins
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

autoload -U compinit; compinit
source ~/.extra/.zsh/fzf-tab/fzf-tab.plugin.zsh

source ~/.extra/.zsh/fzf-git.sh/fzf-git.sh

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOMEBREW_PREFIX/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Activate fuzzy auto-completion and key bindings
source <(fzf --zsh)

source <(zoxide init zsh)
source <(direnv hook zsh)
source <(kubectl completion zsh)

# Activate powerlevel10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
