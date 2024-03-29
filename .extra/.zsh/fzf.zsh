# -------------------------------- Git bindings --------------------------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

alias fzf-down="fzf --height 50% --border"

gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 | sed 's#^remotes/##'
}

gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}

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

fzf-checkout-branch() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed "s/.* //" | sed "s#remotes/[^/]*/##" | { read branch; git checkout $branch }
}
bindkey -s '^Gk' 'fzf-checkout-branch\n'

# Git log
fzf-log() {
  is_in_git_repo || return
  git log --graph --color=always \
    --format="%C(auto)%h%d %s %C(black)%C(bold)%cr %C(auto)%C(blue)%cn" "$@" |
  fzf-down --height 70% --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
    --preview 'git show {2} --stat' --bind "ctrl-m:execute:
  (grep -o '[a-f0-9]\{7\}' | head -1 |
  xargs -I % sh -c 'git show --color=always % | delta --paging always') << 'FZF-EOF'
  {}
  FZF-EOF"
  zle redisplay
}
zle -N fzf-log
bindkey '^Gl' fzf-log


join-lines() {
  local item
  while read item; do
    echo -n "${(q)item} "
  done
}

bind-git-helper() {
  local c
  for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^G$c' fzf-g$c-widget"
  done
}
bind-git-helper f b t h r
unset -f bind-git-helper

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

# -------------------------------- Git bindings --------------------------------


# -------------------------------- Quick bindings --------------------------------

quick-docker-containers() {
  docker ps -a --format "table {{.Names}}\t{{.ID}}\t{{.Status}}" | tail -n +2 |
  fzf-down --ansi --multi --tac --preview-window right:60% \
    --preview 'docker top {1} | head -'$LINES |
  cut -d' ' -f1
}

quick-gd-widget() { local result=$(quick-docker-containers | join-lines); zle reset-prompt; LBUFFER+=$result }
zle -N quick-gd-widget
bindkey '^Qd' quick-gd-widget

# -------------------------------- Quick bindings --------------------------------

diskripper() {
  local VOLUME FILENAME

  FILENAME=$(date +"%Y_%m_%d_%H_%M_%S").iso
  VOLUME=`ls /Volumes/ | fzf-down` \
    && hdiutil makehybrid -iso -joliet -o $FILENAME /Volumes/$VOLUME \
    && noti -t "Disk '$VOLUME' is ripped" -m "'$(pwd)/$FILENAME' is successfully created"
}
