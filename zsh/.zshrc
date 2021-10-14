#!/usr/bin/env zsh
bindkey -v
# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward
if command -v exa >/dev/null; then
  alias l='exa -alF'
else
  alias l='ls -alFG'
fi
alias k=kubectl
alias kv='kubectl -n ves-system'
alias ssh='TERM=xterm-256color ssh'
alias ta='tmux attach -t'
alias tl='tmux list-sessions'
alias ts='tmux new-session -n main -s'
alias vim=nvim
# edit a file with emacsclient -- if no session exists, create one automatically
# export EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
export EDITOR='emacsclient -t -c --alternate-editor=""'
autoload -Uz compinit
autoload bashcompinit
compinit
bashcompinit
command -v aws_completer >/dev/null && complete -C "$(which aws_completer)" aws
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

ulimit -n 4096

zstyle ':completion:*:*:*:*:*' menu select

setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# record history immediately
setopt INC_APPEND_HISTORY
export SAVEHIST=100000
export HISTSIZE=100000
export HISTFILE=~/.zsh_history
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export AWS_SDK_LOAD_CONFIG=1
export AWS_DEFAULT_PROFILE=f5cs
export MAKEFLAGS="${MAKEFLAGS:-""} -j$(nproc)"
export BUILDDIR=/tmp/makepkg
export TZ=America/Los_Angeles
export SAML2AWS_USER_AGENT="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:82.Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:82.0) Gecko/20100101 Firefox/82.00) Gecko/20100101 Firefox/82.0"
if command -v gvm >/dev/null; then
  gvm use go1.14 >/dev/null
fi
if command -v pyenv >/dev/null; then
  eval "$(pyenv init -)"
fi

command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

get-sa-token() {
  context=$1
  secret=$(kubectl --context "$context" -n kube-system get secret \
    | grep f5aas- \
    | awk '{print $1}')
  kubectl --context "$context" -n kube-system describe secret "$secret" \
    | pcregrep '^token:' \
    | awk '{print $2}'
}

tmux-color-command () {
  local hostname="$1"
  shift
  local style="$1"
  shift
  local windowname="$hostname"
  local unique=false
  local i=0
  while ! $unique; do
    i=$(expr $i + 1)
    windowname="${hostname}-$i"
    already_created=$(tmux list-windows | grep "$windowname")
    if [[ -z "$already_created" ]]; then
      unique=true
      tmux new-window -n "$windowname" $@ "$hostname"
      tmux select-window -t "$windowname" && tmux select-pane -P "$style"
    fi
  done
}

tf-reinit() {
  rm -rf .terraform && terraform init 2>&1 | tee init.out
}

tf-plan() {
  terraform plan -out .plan $@ 2>&1 | tee plan.out
}

tf-apply() {
  terraform apply .plan $@ 2>&1 | tee apply.out
}

ssh_agent_pid=$(pgrep '^ssh-agent$')
if ! pgrep -flai ssh-agent >/dev/null; then
  eval $(ssh-agent | tee ~/.ssh/agentrc) >/dev/null \
    && chmod 600 ~/.ssh/agentrc
elif [[ -f ~/.ssh/agentrc ]]; then
  source ~/.ssh/agentrc >/dev/null
  if [[ "$SSH_AGENT_PID" -ne "$ssh_agent_pid" ]]; then
    echo "WARNING: ssh agentrc out of sync. you may want to kill ssh-agent and restart it."
  fi
else
  echo "WARNING: could not setup ssh-agent. you may want to kill and restart it."
fi

aurain() {
  aura -As "$1" | cut -d'/' -f2 | cut -d' ' -f1 | pcregrep '^\w' | fzf --preview 'aura -Ai {1}' | xargs -ro sudo aura -Akax
}

pacin() {
  if [[ -z "$1" ]]; then
    pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -Syu
  else
    pacman -Ssq "$1" | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -Syu
  fi
}

upgrade() {
  sudo pacman -Syuu
  sudo aura -Akaux
}

[[ -s "/home/sawyer/.gvm/scripts/gvm" ]] && source "/home/sawyer/.gvm/scripts/gvm"
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

printf '\e]2;sawyer-dev\a'
