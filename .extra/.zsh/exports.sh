# Preferred editor for local and remote sessions
export EDITOR='nvim'
export VISUAL='nvim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Prefer US English and use UTF-8
export LANG=en_US.UTF-8

# PATH environment variable
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.extra/bin"

# Base16 Shell
BASE16_SCHEME="eighties"
BASE16_SHELL="$HOME/.extra/.zsh/base16-shell/base16-$BASE16_SCHEME.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Adding Vi To Your Zsh
bindkey -v
export KEYTIMEOUT=1
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^R' history-incremental-search-backward