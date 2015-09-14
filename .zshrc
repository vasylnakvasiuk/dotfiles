# Set limit the use of system-wide resources
ulimit -S -n 4096

# Load extra files from ~./extra/.zsh/: oh-my-zsh.sh, exports.sh, aliases.sh, functions.sh, local.sh
# ~/.extra/.local can be used for settings you don’t want to commit
for file in ~/.extra/.zsh/{oh-my-zsh,exports,aliases,functions,local}.sh; do
    [ -r "$file" ] && source "$file"
done
unset file

[ -f ~/.extra/.zsh/fzf/.fzf.zsh ] && source ~/.extra/.zsh/fzf/.fzf.zsh

# Base16 Shell
BASE16_SHELL="$HOME/.extra/.zsh/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL