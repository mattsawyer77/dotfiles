#!/usr/bin/env zsh
bindkey -v

if [[ $(uname) == "Darwin" ]]; then
  OS=mac
  export ZPLUG_HOME=/usr/local/opt/zplug
else
  OS=linux
  export ZPLUG_HOME=/usr/share/zsh/scripts/zplug
fi
source $ZPLUG_HOME/init.zsh

# zplug "mafredri/zsh-async", from:"github", use:"async.zsh"
# zplug "sindresorhus/pure", use:"pure.zsh", as:theme, on:"mafredri/zsh-async"
zplug "zsh-users/zsh-autosuggestions", defer:1
zplug "lotabout/skim", use:"shell/*.zsh", defer:1
zplug "vim/vim", defer:1
zplug "trapd00r/LS_COLORS", defer:1
# zplug "plugins/aws", from:oh-my-zsh, defer:1
zplug "plugins/docker", from:oh-my-zsh, defer:1
zplug "plugins/kubectl", from:oh-my-zsh, defer:1
zplug "plugins/tmux", from:oh-my-zsh, defer:1
zplug "plugins/terraform", from:oh-my-zsh, defer:1
zplug "plugins/stack", from:oh-my-zsh, defer:1
zplug "zdharma/zsh-diff-so-fancy", as:command, use:"bin/", defer:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Then, source plugins and add commands to $PATH
zplug load

command -v aws_completer >/dev/null && complete -C "$(which aws_completer)" aws

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
export SAVEHIST=5000
export HISTSIZE=100000

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export AWS_SDK_LOAD_CONFIG=1
export AWS_DEFAULT_PROFILE=f5cs
if command -v go >/dev/null; then
  export GOROOT="/usr/local/Cellar/go/$(go version -v 2>&1 | pcregrep -o '\d+\.\d+\.\d+')/libexec"
fi
if command -v pyenv >/dev/null; then
  eval "$(pyenv init -)"
fi

alias ssh='TERM=xterm-256color ssh'
alias vim=nvim
alias socks4proxy='ssh -D 8888 -f -C -q -N'
if [[ $OS == "mac" ]]; then
  alias randomizeMacAddress="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"
fi
alias k=kubectl
if command -v exa >/dev/null; then
  alias l='exa -alF'
else
  alias l='ls -alFG'
fi
alias ts='tmux new-session -n main -s'
alias ta='tmux attach -t'
alias k=kubectl
# edit a file with emacsclient -- if no session exists, create one automatically
alias em='emacsclient -t -c --alternate-editor=""'
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

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

tf-destroy() {
  terraform destroy $@ 2>&1 | tee destroy.out
}

zplug-upgrade() {
  # Install plugins if there are plugins that have not been installed
  if ! zplug check --verbose; then
    printf "Install zsh plugins? [y/N]: "
    if read -q; then
      echo; zplug install && zplug load --verbose
    fi
  else
    echo "plugins are installed."
  fi
  zplug update
}

unbound-update() {
  if command -v dns_blocklist_updater >/dev/null; then
    echo "getting latest block list and transforming..." \
      && dns_blocklist_updater >zone-block-general.conf \
      && echo "installing block list configuration..." \
      && sudo cp zone-block-general.conf /usr/local/etc/unbound/zone-block-general.conf \
      && echo "restarting unbound..." \
      && sudo launchctl unload /Library/LaunchDaemons/net.unbound.plist \
      && sleep 2 \
      && sudo launchctl load /Library/LaunchDaemons/net.unbound.plist \
      && sleep 2 \
      && pgrep -flai unbound
  else
    echo >&2 "dns_blocklist_updater is not installed, skipping."
    exit 1
  fi
}
