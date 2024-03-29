# Preferred editor for local and remote sessions
export EDITOR=hx
export VISUAL=$EDITOR

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Prefer US English and use UTF-8
export LANG=en_US.UTF-8

# Less configuration
LESS='-i -M -R'

# PATH environment variable
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/opt/homebrew/bin:$HOME/.extra/bin"

# Disable auto renaming window title in tmux
DISABLE_AUTO_TITLE=true

# Now fzf uses ag like a backend
export FZF_DEFAULT_COMMAND='rg --files --sort-files --hidden --follow --glob "!.git"'
export FZF_DEFAULT_OPTS='--color=dark,bg+:18 --bind=ctrl-z:toggle-up --inline-info --height 50% --no-reverse --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--no-reverse'
