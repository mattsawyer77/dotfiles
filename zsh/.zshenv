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
export NVM_DIR="$HOME/.nvm"
# For compilers to find openssl@1.1 you may need to set:
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"

#For pkg-config to find openssl@1.1 you may need to set:
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export LESS='-F -i -M -R -X --incsearch'
export TERM=xterm-24bit
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
export BAT_THEME=1337
export BAT_PAGER="less $LESS"
# If you need to have openssl@1.1 first in your PATH run:
# PATH="/usr/local/opt/openssl@1.1/bin:$PATH":$PATH
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

find-proto-import-path() {
  local dirs=""
  local target_dir="$1"
  (test -d "$target_dir" || echo >&2 "$target_dir is not a valid dir") \
    && dirs=$(cd "$target_dir" \
      && typeset -A import_paths \
      && for import in $(grep -h import *.proto | cut -d'"' -f2); do \
        if [[ -z "${import_paths[$import]}" ]]; then
           paths=$(find $(realpath --relative-to . $(git rev-parse --show-toplevel)) -wholename "*$import" \
            | sd "/$import" "" \
            | sd '^(.+)$' '    \"$1\"') \
           import_paths+=( ["$import"]="$paths" )
        fi
        echo "${import_paths[$import]}"
      done \
    | sort -u)
  echo "$dirs"
}

generate-protoc-import-dir-locals() {
  if [[ ! -v 1 ]]; then root_dir=.; else root_dir="$1"; fi
  echo "generating .dir-locals.el for each directory recursively from ${root_dir}..."
  repo_proto_dirs=($(fd '\.proto$' "$root_dir" -x dirname | sort -u))
  for repo_proto_dir in $repo_proto_dirs; do
    import_dirs=$(find-proto-import-path "$repo_proto_dir")
    if [[ -n "$import_dirs" ]]; then
      echo " - generating ${repo_proto_dir}/.dir-locals.el"
      cat >"${repo_proto_dir}/.dir-locals.el" <<EOF
((protobuf-mode .
  ((flycheck-protoc-import-path .
    (
$import_dirs
     )))))
EOF
    else
      echo " - no import dirs found for $repo_proto_dir"
    fi
  done
}

skopeo-inspect() {
  local url
  if echo "$url" | grep '^docker://' >/dev/null; then
    url="$1"
  else
    url="docker://$1"
  fi
  skopeo inspect "$url" \
    | jq -r '.Labels."commit-sha"'
}

skopeo-inspect-digest() {
  local url
  if echo "$url" | grep '^docker://' >/dev/null; then
    url="$1"
  else
    url="docker://$1"
  fi
  skopeo inspect "$url" \
    | jq -r '.Digest'
}

skopeo-inspect-commit() {
  commit=$(skopeo-inspect "$1")
  if [[ "$?" -eq 0 ]] && [[ -n "$commit" ]]; then
    git fetch
    git log --all -n 1 "$commit"
  fi
}

volterra-ss-commit() {
  local ss="$1"
  image=$(kubectl -n ves-system get statefulset "$ss" -o json \
    | jq -r '.spec.template.spec.containers[]|{image,name}|select(.name=="'"$ss"'")|.image')
  if [[ -z "$image" ]]; then
    echo >&2 "no image found for statefulset $ss"
  else
    skopeo inspect docker://"$image" \
      | jq -r '.Labels."commit-sha"'
  fi
}

volterra-ds-commit() {
  local ss="$1"
  image=$(kubectl -n ves-system get daemonset "$ds" -o json \
    | jq -r '.spec.template.spec.containers[]|{image,name}|select(.name=="'"$ds"'")|.image')
  if [[ -z "$image" ]]; then
    echo >&2 "no image found for daemonset $ds"
  else
    skopeo inspect docker://"$image" \
      | jq -r '.Labels."commit-sha"'
  fi
}

docker-shell() {
  local image="${1:-volterra.azurecr.io/ves.io/go-builder:0.31}"
  local cmd="${2:-bash}"
  local temp_passwd_file="$(mktemp)"
  local project_root="$(git rev-parse --show-toplevel)"
  local go_src_dir=$(echo $project_root | sed "s^.*src/\(.*\)^src/\1^")
  local go_cache_dir="${project_root}/.cache-docker/go"
  echo "running container shell with $image"
  echo "${USER}:x:${UID}:${GID}:Volterra User:${HOME}:/bin/bash" > "$temp_passwd_file" && \
    mkdir -p "${project_root}/.cache.go" && \
    docker run --rm -it \
      --user ${UID}:${GID} --userns=host \
      --env GOCACHE=${go_cache_dir} \
      --env GOPATH=${GOPATH} \
      --env HOME=${HOME} \
      --env TERM=xterm-256color \
      --env PS1="${image}:\w> " \
      --env DOCKER_IMAGE="$image" \
      --net host \
      -v "$temp_passwd_file":/etc/passwd:ro,Z \
      -v ${PWD}:/go/${GOPATH}/src:Z \
      -v ${HOME}/.gitconfig:${HOME}/.gitconfig:ro \
      -v ${HOME}/.ssh:${HOME}/.ssh:ro \
      -v ${GOPATH}:${GOPATH} \
      -v ${project_root}:${project_root} \
      -v "${HOME}/.bashrc":"${HOME}/.bashrc" \
      -w ${project_root} \
      ${image} \
      ${cmd}
  test -f "$temp_passwd_file" && rm -f "$temp_passwd_file"
}
