export ZSH=$HOME/.oh-my-zsh
# export UPDATE_ZSH_DAYS=13
export LANG=en_US.UTF-8
export P4CONFIG=.p4config
export P4USER=sawyer
export P4IGNORE=.p4ignore
export P4DIFF=/usr/local/bin/ksdiff
export P4MERGE=/usr/local/bin/ksdiff
export P4TICKETS=$HOME/.p4tickets
export GOPATH=~/gocode
export GO111MODULE=on
export EDITOR="emacsclient -t -a 'emacs -nw'"
export VISUAL=$EDITOR
export FZF_DEFAULT_COMMAND='ag -g ""'
export BAT_THEME=1337
export NVM_DIR="$HOME/.nvm"
# For compilers to find openssl@1.1 you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

#For pkg-config to find openssl@1.1 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
# If you need to have openssl@1.1 first in your PATH run:
PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
# PATH="/usr/local/opt/terraform@0.12/bin:$PATH"
PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.local/share/ponyup/bin
PATH=$PATH:$HOME/.nvm/versions/node/v12.11.1/bin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$HOME/.cabal/bin
PATH=$PATH:$HOME/.fzf/bin
PATH=$PATH:$GOPATH/bin
PATH=$PATH:$HOME/.pyenv/shims
PATH=$PATH:/usr/local/opt/curl/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/sbin
export PATH

export LESS='-F -g -i -M -r -w -X -z-4'
export TERM=xterm-24bit
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
export BAT_THEME=1337
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then . ~/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

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

ec2-instance-info() {
  local instances=$1
  local instance_id=$2
  echo "$instances" \
      | jq -r 'select(.InstanceId=="'$instance_id'")|.Tags|from_entries|to_entries|map("\(.key): \(.value)")|.[]' 2>/dev/null \
      | sort
}

ssm() {
  local instances=$(aws ec2 describe-instances --output json \
      | jq -r '.Reservations[].Instances[]|select(.State.Name=="running")' \
      2>/dev/null)
  if [[ $? -eq 0 ]] && [[ -n "$instances" ]]; then
    instance_id=$(echo "$instances" \
        | jq -r '{InstanceId,Tags:.Tags|from_entries}|"\(.Tags.Name): \(.InstanceId)"' \
        2>/dev/null \
      | sort \
      | INSTANCES=$instances fzf \
        --preview-window "right:60%" \
        --preview $'ec2-instance-info $INSTANCES {2}' \
      | awk '{print $2}')
    if [[ -n "$instance_id" ]]; then
      aws ssm start-session --target $instance_id
    else
      echo "no instance selected."
    fi
  else
    echo "no instances found."
  fi
}
source "$HOME/.cargo/env"
