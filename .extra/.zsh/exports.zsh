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

# Disable auto renaming window title in tmux
DISABLE_AUTO_TITLE=true

# Now fzf uses ag like a backend
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_DEFAULT_OPTS='--bind=ctrl-z:toggle-up'
export FZF_TMUX=1

# With that fix <C-H> works in neovim
# https://github.com/neovim/neovim/issues/2048#issuecomment-78045837
export TERMINFO="$HOME/.terminfo"
[[ -f ~/.$TERM.ti ]] || infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/.$TERM.ti
tic ~/.$TERM.ti
