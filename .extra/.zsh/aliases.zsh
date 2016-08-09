# Shortcuts
alias p="cd $HOME/Projects"
alias h="history"
alias g="git"
alias v="nvim"
alias vim="nvim"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles 1 && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles 0 && killall Finder"

# Force tmux to assume the terminal supports 256 colours
alias tmux="tmux -2"

# Tmux helperstb
alias tb="tmux-bootstrap"
alias tk="tmux kill-server"
