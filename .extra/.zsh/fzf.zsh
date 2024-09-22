# -------------------------------- Git bindings --------------------------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

alias fzf-down="fzf --height 50% --border"

# Checkout git commit
fzf-checkout-commit() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}" | { read commit; git checkout $commit }
}
bindkey -s '^Go' 'fzf-checkout-commit\n'
bindkey -s '^G^O' 'fzf-checkout-commit\n'

fzf-checkout-branch() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed "s/.* //" | sed "s#remotes/[^/]*/##" | { read branch; git checkout $branch }
}
bindkey -s '^Gk' 'fzf-checkout-branch\n'
bindkey -s '^G^K' 'fzf-checkout-branch\n'

fzf-log() {
  is_in_git_repo || return
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr %C(auto)%C(blue)%cn" "$@" |
  fzf-down --height 70% --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs -I % sh -c "git show --stat --color=always %; echo \"\n---\n\"; git show --color=always --patch %"' --bind "ctrl-m:execute:
  (grep -o '[a-f0-9]\{7\}' | head -1 |
  xargs -I % sh -c 'git show --color=always % | delta --paging always') << 'FZF-EOF'
  {}
  FZF-EOF"
  zle redisplay
}
zle -N fzf-log
bindkey '^Gj' fzf-log
bindkey '^G^J' fzf-log

fzf-flog() {
  # Usage:
  # $ fzf-flog <revision range>
  is_in_git_repo || return
  git diff --name-status "$@" --color=always |
  fzf-down --height 70% --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --bind "ctrl-m:execute:
  ( head -1 | cut -f 2 | rev | cut -c 2- | rev |
  xargs -I % sh -c 'git diff --color=always "$@" -- % | delta --paging always') << 'FZF-EOF'
  {}
  FZF-EOF" \
    --bind "ctrl-l:execute:
  ( head -1 | cut -f 2 | rev | cut -c 2- | rev |
  xargs -I % sh -c 'git log --color=always --stat "$@" -- % | delta --paging always') << 'FZF-EOF'
  {}
  FZF-EOF" \
    --bind "ctrl-d:execute:
  ( head -1 | cut -f 2 | rev | cut -c 2- | rev |
  xargs -I % sh -c 'git log --color=always -p "$@" -- % | delta --paging always') << 'FZF-EOF'
  {}
  FZF-EOF"
  zle redisplay
}
zle -N fzf-flog
bindkey '^Gu' fzf-flog
bindkey '^G^U' fzf-flog

# -------------------------------- Git bindings --------------------------------

diskripper() {
  local VOLUME FILENAME

  FILENAME=$(date +"%Y_%m_%d_%H_%M_%S").iso
  VOLUME=`ls /Volumes/ | fzf-down` \
    && hdiutil makehybrid -iso -joliet -o $FILENAME /Volumes/$VOLUME \
    && noti -t "Disk '$VOLUME' is ripped" -m "'$(pwd)/$FILENAME' is successfully created"
}
