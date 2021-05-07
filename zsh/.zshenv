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
source "$HOME/.cargo/env"
if [ -e /Users/sawyer/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/sawyer/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

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
  sudo systemsetup -setcomputersleep Never \
    && terraform apply .plan $@ 2>&1 | tee apply.out;
  sudo systemsetup -setcomputersleep 15
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

brewin() {
  if [[ -z "$1" ]]; then
    brew search --formulae | pcregrep '^\w' | fzf --multi --preview 'brew info {1}' | xargs -I% -o brew install "%"
  else
    brew search --formulae "$1" | pcregrep '^\w' | fzf --multi --preview 'brew info {1}' | xargs -I% -o brew install "%"
  fi
}

rust-analyzer-upgrade() {
  if [[ -v 1 ]]; then
    RA_VERSION="$1"
    echo "checking rust-analyzer releases for version ${RA_VERSION}..."
    RELEASE=$(curl -SsH "Accept: application/vnd.github.v3+json" \
      https://api.github.com/repos/rust-analyzer/rust-analyzer/releases \
      | jq -r '.[]|select(.tag_name=="'"$RA_VERSION"'")')
    if [[ -n "$RELEASE" ]]; then
      RA_URL=$(echo "$RELEASE" \
        | jq -r '.assets[]|select(.name=="rust-analyzer-mac")|.browser_download_url' \
        | sort -r \
        | head -1) || echo "something went wrong"
    else
      echo >&2 "could not find a release for $RA_VERSION"
    fi
  else
    echo "querying rust-analyzer releases to find the latest version..."
    RA_URL=$(curl -SsfH "Accept: application/vnd.github.v3+json" \
      https://api.github.com/repos/rust-analyzer/rust-analyzer/releases \
      | jq -r '.[]|select(.prerelease==false)|.assets[]|select(.name=="rust-analyzer-mac")|.browser_download_url' \
      | sort -r \
      | head -1)
    if [[ -z "$RA_URL" ]]; then
      echo >&2 "could not find a URL for the latest rust-analyzer"
    fi
  fi
  if [[ -n "$RA_URL" ]]; then
    echo "installing rust-analyzer from ${RA_URL}..."
    curl -SsfLo ~/.local/bin/rust-analyzer "$RA_URL" \
      && chmod 755 ~/.local/bin/rust-analyzer \
      && echo "rust-analyzer installed successfully."
  fi
}

launchctl-restart() {
  if [[ -v 1 ]]; then
    pattern="$1"
    services=($(launchctl list | pcregrep "$pattern" | awk '{print $3}'))
    for service in $services; do
      plist=($(find /Library/Launch* ~/Library/LaunchAgents -name "${service}.plist" | head -1 || :))
      echo "stopping service ${service}..."
      launchctl unload "$plist" \
        && echo "service ${service} stopped, restarting..." \
        && launchctl load "$plist" \
        && echo "service ${service} restarted successfully."
    done
  else
    echo >&2 "must specify a pattern for a service to restart"
  fi
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

