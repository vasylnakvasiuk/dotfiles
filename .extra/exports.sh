# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='subl -w'
fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Prefer US English and use UTF-8
export LANG=en_US.UTF-8

# PATH environment variable
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"