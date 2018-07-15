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
BASE16_SHELL="$HOME/.extra/.zsh/base16-shell/base16-$BASE16_SCHEME.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

# Disable auto renaming window title in tmux
DISABLE_AUTO_TITLE=true

# Now fzf uses ag like a backend
export FZF_DEFAULT_COMMAND='ag -g "" --hidden'
export FZF_DEFAULT_OPTS='--color=dark,bg+:18 --bind=ctrl-z:toggle-up --inline-info --height 50% --no-reverse --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--no-reverse'

# Powerlevel9k
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs virtualenv time)
