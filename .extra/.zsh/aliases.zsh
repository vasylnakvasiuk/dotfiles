# Shortcuts
alias p="cd $HOME/Projects"
alias h="history"
alias g="git"
alias v="nvim"
alias vim="nvim"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1 || ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Force tmux to assume the terminal supports 256 colours
alias tmux="tmux -2"

# Tmux helperstb
alias tb="tmux-bootstrap"
alias tk="tmux kill-server"

# Bitcoin aliases
bitcoin_progress(){
	bitcoin-cli getblockchaininfo | jq .verificationprogress | awk '{printf "Blockchain progress = %4.2f%%\n",$1*100}'
}
alias bitcoin-progress=bitcoin_progress
unset bitcoin_progress

# For correct work `watch` + `aliases`
alias watch="watch "

# Use pretty ls
alias l="exa -lagh --time-style long-iso --octal-permissions --icons"
alias ll="exa -laaghHimuU --time-style long-iso --git --octal-permissions --icons"

# Use j as z
alias j="z"

alias preview="fzf --preview 'bat --color \"always\" {}' --bind='ctrl-o:execute(code {})+abort'"
alias cat="bat"
alias ping="prettyping --nolegend"
alias fd="fd -H"
alias du="ncdu --color dark -r -x"
alias help="tldr"
