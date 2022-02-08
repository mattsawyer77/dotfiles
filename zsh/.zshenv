export LANG=en_US.UTF-8
export GOPATH=~/gocode
export GO111MODULE=on
export FZF_DEFAULT_COMMAND='rg -g ""'
export FZF_DEFAULT_OPTS="--layout=default --info=inline --tac"
# export NVM_DIR="$HOME/.nvm"
export LESS='-F -i -M -R -X --incsearch'
# export TERM=xterm-24bit
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
export BAT_THEME=1337
export BAT_PAGER="less $LESS"

if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  . ~/.nix-profile/etc/profile.d/nix.sh;
fi # added by Nix installer

PATH=$PATH:$HOME/.local/bin
PATH=$PATH:$HOME/.cargo/bin
PATH=$PATH:$GOPATH/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/usr/local/sbin
PATH=$PATH:/usr/bin
PATH=$PATH:/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/sbin
export PATH

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

git-cleanup-branches() {
  # prune local tracking branchces that no longer exist on the origin
  git remote prune origin
  # delete local branches that have been merged to main/master
  git branch --merged | pcregrep -v '\*|master|main' | cut -c3- | xargs git branch -d
  # prompt the user for any remaining branches to be deleted
  local branches=($(git branch | pcregrep -v '\*|master|main' | cut -c3-))
  local answer=""
  for branch in $branches; do
    while [[ "$answer" != "n" ]] && [[ "$answer" != "y" ]]; do
      echo -n "delete branch ${branch} [y/n/d(iff)/q(uit)]? "
      read -r answer
      if echo "$answer" | pcregrep '^d' >/dev/null; then
        git log -p .."$branch"
      elif echo "$answer" | pcregrep '^q' >/dev/null; then
        return
      elif [[ "$answer" == "y" ]]; then
        git branch -D "$branch"
      fi
    done
  done
}

git-cache() {
  pushd . >/dev/null
  cd $(git rev-parse --show-toplevel)
  local project_name=$(git remote -v | grep '(push)' | awk '{print $2}' | cut -d':' -f2)
  local branch_name=$(git branch | grep '^*' | cut -c3-)
  local ignored_paths=($(git status --ignored --porcelain | cut -c4-))
  local cache_dir="$HOME/.local/cache/${project_name}/${branch_name}"
  test -d "$cache_dir" || (echo "creating cache dir ${cache_dir}...")
  mkdir -p "$cache_dir" || (echo >&2 "could not create cache dir $cache_dir"; exit 1)
  for ignored_path in $ignored_paths; do
    echo "syncing $ignored_path"' -> '"${cache_dir}/${ignored_path}"
    rsync -a --delete "$ignored_path" "${cache_dir}"
  done
  popd >/dev/null
}

git-restore() {
  pushd . >/dev/null
  cd $(git rev-parse --show-toplevel)
  local project_name=$(git remote -v | grep '(push)' | awk '{print $2}' | cut -d':' -f2)
  local branch_name=$(git branch | grep '^*' | cut -c3-)
  local cache_dir="$HOME/.local/cache/${project_name}/${branch_name}"
  test -d "$cache_dir" || (echo >&2 "no cache found for ${project_name}/${branch_name}"; exit 1)
  local cached_paths=($(find "${cache_dir}/"* -maxdepth 0))
  for cached_path in $cached_paths; do
    echo "restoring $cached_path"
    rsync -a "$cached_path" .
  done
  popd >/dev/null
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

volterra-envs() {
  local name="$1"
  if [[ ! -v 1 ]]; then
    echo >&2 "ERROR: name required!\nusage: volterra-envs [name]"
    echo >&2 "example: volterra-envs akar"
  else
    envs=$(kubectl -n ves-system get pod -l "app=$name" -o json \
      | jq -rc '.items|first|.spec.containers[]|select(.name=="'"$name"'")|.env[]|.name+": "+((.valueFrom|tostring)//.value)')
    if [[ -z "$envs" ]]; then
      echo >&2 "no environment variables found for a pod with labels app.kubernetes.io/instance=$name"
    else
      echo "$envs"
    fi
  fi
}

volterra-configmap() {
  local name="$1"
  if [[ ! -v 1 ]]; then
    echo >&2 "ERROR: name required!\nusage: volterra-configmap [name]"
    echo >&2 "example: volterra-configmap akar"
  else
    envs=$(kubectl -n ves-system get configmap -l "app.kubernetes.io/instance=$name" -o json \
      | kv get configmap -l "app.kubernetes.io/instance=$name" -o json \
      | jq -r '.items|first|.data|."config.yml"//."'"$name"'.yml"')
    if [[ -z "$envs" ]]; then
      echo >&2 "no configmap found for a pod with labels $app.kubernetes.io/instance=$name"
    else
      echo "$envs"
    fi
  fi
}

volterra-commit() {
  local resource_type="$1"
  local name="$2"
  if [[ ! -v 1 ]] || [[ ! -v 2 ]]; then
    echo >&2 "ERROR: resource type and name are required!\nusage: volterra-commit <k8s-resource-type> <k8s-resource-name> [container name (defaults to resource name)]"
  else
    local container="${3:-$name}"
    image=$(kubectl -n ves-system get "$resource_type" "$name" -o json \
      | jq -r '.spec.template.spec.containers[]|{image,name}|select(.name=="'"$container"'")|.image')
    if [[ -z "$image" ]]; then
      echo >&2 "no image found for $resource_type $name"
    else
      echo "image: $image"
      if ! command -v skopeo >/dev/null || echo "$image" | grep azurecr.io >/dev/null; then
        # skopeo doesn't work with docker for mac apparently
      docker pull "$image" --quiet \
        && commit_sha=$(docker inspect "$image" \
        | jq -r '.[].Config.Labels."commit-sha"') \
        && repo=$(echo "$image" | perl -pe 's@.*/ves\.io/(\w+).*@\1@')
      else
        commit_sha=$(skopeo inspect docker://"$image" \
          | jq -r '.Labels."commit-sha"') \
        && repo=$(echo "$image" | perl -pe 's@.*volterraio/(\w+).*@\1@')
      fi
      if [[ -n "$commit_sha" ]] && [[ -n "$repo" ]]; then
        repo_dir=$(realpath ~/workspaces/volterra/ves.io/"$repo")
        if [[ -d "$repo_dir" ]]; then
          git -C "$repo_dir" log -n 1 origin "$commit_sha" \
            || (git -C "$repo_dir" fetch --quiet origin && git -C "$repo_dir" log -n 1 origin "$commit_sha")
        else
          echo >&2 -n "repo dir $repo_dir does not exist"
        fi
      else
        echo >&2 "ERROR: unable to determine commit sha or repo for $image"
      fi
    fi
  fi
}

gcr-info() {
  if [[ -v 1 ]]; then
    local repo="$1"
    local branch=${2:-master}
    gcloud container images list-tags "gcr.io/volterraio/$repo" \
      --format=json \
      --sort-by=timestamp \
      | jq -r '.[]|last(select(.tags|index("branch-'"$branch"'")))'
  else
    echo >&2 "ERROR: must specify a repo"
    false
  fi
}

gcr-digest() {
  if [[ -v 1 ]]; then
    local repo="$1"
    local branch=${2:-master}
    gcloud container images list-tags "gcr.io/volterraio/$repo" \
      --format=json \
      --sort-by=timestamp \
      | jq -r '.[]|last(select(.tags|index("branch-'"$branch"'")))|.digest'
  else
    echo >&2 "ERROR: must specify a repo"
    false
  fi
}

volterra-vpn() {
  if ! command -v openfortivpn >/dev/null; then
    echo >&2 "openfortivpn not found."
    return 1
  fi
  local config_file=~/.config/openfortivpn/config
  if [[ -f "$config_file" ]]; then
    local servers=$(pcregrep -o 'vpnssl-.*acorus.net' "$config_file" 2>/dev/null)
    if [[ $? -eq 0 ]] && [[ -n "$servers" ]]; then
      server=$(echo "$servers" \
        | sort -u \
        | fzf)
      if [[ -n "$server" ]]; then
        sudo -E openfortivpn "$server" -c "$config_file"; notify
      else
        echo >&2 "no server selected."
        return 1
      fi
    else
      echo >&2 "no servers found."
      return 1
    fi
  else
    echo >&2 "config file $config_file does not exist"
    return 1
  fi

  echo "clearing DNS cache, which requires sudo:"
  dscacheutil -flushcache && sudo killall -HUP mDNSResponder
}

docker-shell () {
  local image="${1:-$(pcregrep -o 'volterra.*go-builder:v?[\d\.]+' .gitlab-ci.yml)}"
  if [[ -z "$image" ]]; then
    echo >&2 "ERROR: no image specified, and go-builder image could not be derived from .gitlab-ci.yml"
  else
    local cmd="${2:-bash}"
    local temp_passwd_file="$(mktemp)"
    local project_root="$(git rev-parse --show-toplevel)"
    local go_src_dir=$(echo $project_root | sed "s^.*src/\(.*\)^src/\1^")
    local go_cache_dir="${project_root}/.cache-docker/go"
    echo "running container shell with $image"
    echo "${USER}:x:${UID}:${GID}:Volterra User:${HOME}:/bin/bash" > "$temp_passwd_file" \
      && mkdir -p "${project_root}/.cache.go" \
      && docker run --rm -it --user ${UID}:${GID} --userns=host \
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
        ${image} ${cmd}
    test -f "$temp_passwd_file" && rm -f "$temp_passwd_file"
  fi
}

# use after some long-running process to notify you while your
# brain's executive function is hyperfocusing on something else
notify() {
  exit_code=$?
  current_cl=${history[$HISTCMD]}
  last_cmd=$(echo "$current_cl" | sed 's/;[^;]*$//' | sed 's/"//g')
  title="with title \"$last_cmd\""
  if [[ -v 1 ]]; then
    title="with title \"$1\""
  fi
  if [[ $exit_code -eq 0 ]]; then
    osascript -e "display notification \"command succeeded\" $title sound name \"Funk\""
  else
    osascript -e "display notification \"command failed\" $title sound name \"Sosumi\""
  fi
}

streakctl() {
  GRPC_TLS_PORT=${STREAK_GRPC_TLS_PORT:-$(kubectl -n ves-system get configmap streak-config -o json | jq -r '.data."config.yml"' | yq e '.GrpcTLSPort' -)}
  echo "streak GRPC TLS port: $GRPC_TLS_PORT" >&2
  SERVER_CN=${STREAK_SERVER_CN:-$(kubectl -n ves-system get statefulset streak -o json | jq -r '.spec.template.spec.containers[]|select(.name=="wingman")|.env|from_entries|.serviceNames' | cut -d',' -f1)}
  POD_NAME=${STREAK_POD:-"streak-0"}
  echo "streak CN: $SERVER_CN" >&2
  if [[ -n "$GRPC_TLS_PORT" ]]; then
    kubectl -n ves-system -c streak exec -it "$POD_NAME" -c streak -- \
      streakctl -u "localhost:${GRPC_TLS_PORT}" --server-cn "$SERVER_CN" \
      $@
  else
    echo "could not determine streak's GRPC TLS port"
  fi
}

mauricectl() {
  GRPC_TLS_PORT=${MAURICE_GRPC_TLS_PORT:-6002}
  echo "maurice GRPC TLS port: $GRPC_TLS_PORT" >&2
  SERVER_CN=${MAURICE_SERVER_CN:-maurice.ves-system.svc.cluster.local}
  echo "maurice CN: $SERVER_CN" >&2
  if [[ -n "$GRPC_TLS_PORT" ]]; then
    maurice_pod=$(kubectl -n ves-system get pods | grep maurice | awk '{print $1}')
    if [[ -n "$maurice_pod" ]]; then
      kubectl -n ves-system -c maurice exec -it "$maurice_pod" -c maurice -- \
        mauricectl -u "localhost:${GRPC_TLS_PORT}" --server-cn "$SERVER_CN" \
        $@
    else
      echo "could not find a running maurice pod" >&2
    fi
  else
    echo "could not determine maurice's GRPC TLS port"
  fi
}

vulpixctl() {
  GRPC_TLS_PORT=${VULPIX_GRPC_TLS_PORT:-$(kubectl -n ves-system get configmap vulpix-config -o json | jq -r '.data."config.yml"' | yq e '.GrpcTLSPort' -)}
  echo "vulpix GRPC TLS port: $GRPC_TLS_PORT" >&2
  SERVER_CN=${VULPIX_SERVER_CN:-$(kubectl -n ves-system get deployment vulpix -o json | jq -r '.spec.template.spec.containers[]|select(.name=="wingman")|.env|from_entries|.serviceNames' | cut -d',' -f1)}
  echo "vulpix CN: $SERVER_CN" >&2
  if [[ -n "$GRPC_TLS_PORT" ]]; then
    vulpix_pod=$(kubectl -n ves-system get pods | grep vulpix | awk '{print $1}')
    if [[ -n "$vulpix_pod" ]]; then
      kubectl -n ves-system -c vulpix exec -it "$vulpix_pod" -c vulpix -- \
        vulpixctl -u "localhost:${GRPC_TLS_PORT}" --server-cn "$SERVER_CN" \
        $@
    else
      echo "could not find a running vulpix pod" >&2
    fi
  else
    echo "could not determine vulpix's GRPC TLS port"
  fi
}

griffinctl() {
  GRPC_TLS_PORT=${GRIFFIN_GRPC_TLS_PORT:-$(kubectl -n ves-system get configmap griffin-config -o json | jq -r '.data."config.yml"' | yq e '.GrpcTLSPort' -)}
  echo "griffin GRPC TLS port: $GRPC_TLS_PORT" >&2
  SERVER_CN=${GRIFFIN_SERVER_CN:-$(kubectl -n ves-system get deployment griffin -o json | jq -r '.spec.template.spec.containers[]|select(.name=="wingman")|.env|from_entries|.serviceNames' | cut -d',' -f1)}
  echo "griffin CN: $SERVER_CN" >&2
  if [[ -n "$GRPC_TLS_PORT" ]]; then
    griffin_pod=$(kubectl -n ves-system get pods | grep griffin | awk '{print $1}')
    if [[ -n "$griffin_pod" ]]; then
      kubectl -n ves-system -c griffin exec -it "$griffin_pod" -c griffin -- \
        griffinctl -u "localhost:${GRPC_TLS_PORT}" --server-cn "$SERVER_CN" \
        $@
    else
      echo "could not find a running griffin pod" >&2
    fi
  else
    echo "could not determine griffin's GRPC TLS port"
  fi
}

akarctl() {
  GRPC_TLS_PORT=${AKAR_GRPC_TLS_PORT:-$(kubectl -n ves-system get configmap akar-config -o json | jq -r '.data."config.yml"' | yq e '.GrpcTLSPort' -)}
  echo "akar GRPC TLS port: $GRPC_TLS_PORT" >&2
  SERVER_CN=${AKAR_SERVER_CN:-$(kubectl -n ves-system get deployment akar -o json | jq -r '.spec.template.spec.containers[]|select(.name=="wingman")|.env|from_entries|.serviceNames' | cut -d',' -f1)}
  echo "akar CN: $SERVER_CN" >&2
  if [[ -n "$GRPC_TLS_PORT" ]]; then
    akar_pod=$(kubectl -n ves-system get pods | grep akar | grep -v readonly | awk '{print $1}')
    if [[ -n "$akar_pod" ]]; then
      kubectl -n ves-system -c akar exec -it "$akar_pod" -c akar -- \
        akarctl -u "localhost:${GRPC_TLS_PORT}" --server-cn "$SERVER_CN" \
        $@
    else
      echo "could not find a running akar pod" >&2
    fi
  else
    echo "could not determine akar's GRPC TLS port"
  fi
}

nioctl() {
  local usage="usage:\nnioctl deployment-name|statefulset-name kubectl-args"
  local service_name="$1"
  if [[ ! -v service_name ]]; then
    echo >&2 "k8s name (pod prefix) is required"
    echo >&2 "$usage"
    return 1
  fi
  shift
  local service_json=$(kubectl -n ves-system get statefulset,daemonset,deployment "$service_name" -o json 2>/dev/null)
  local service=$(printf '%s\n' "$service_json" | jq -r '.items|first' 2>/dev/null)
  if [[ -z "$service" ]]; then
    echo >&2 "could not find a statefulset, daemonset, or deployment named $service_name"
    return 1
  fi
  local kind=$(printf '%s\n' "$service" | jq -r '.kind')
  if [[ -z "$kind" ]]; then
    echo >&2 "could not determine kind of service $service_name"
    return 1
  fi
  GRPC_TLS_PORT=${NIO_GRPC_TLS_PORT:-$(kubectl -n ves-system get configmap "${service_name}-config" -o json \
    | jq -r '.data."nio.yml"' \
    | yq e '.GrpcTLSPort' -)}
  # echo "nio GRPC TLS port: $GRPC_TLS_PORT" >&2
  SERVER_CN=${NIO_SERVER_CN:-$(printf '%s\n' "$service" \
    | jq -r '.spec.template.spec.containers[]|select(.name=="wingman")|.env|from_entries|.serviceNames|split(",")|last')}
  # echo "nio CN: $SERVER_CN" >&2
  if [[ -n "$GRPC_TLS_PORT" ]]; then
    nio_pod=$(kubectl -n ves-system get pods --no-headers -l name="${service_name}" | awk '{print $1}' | head -1)
    if [[ -n "$nio_pod" ]]; then
      kubectl -n ves-system exec -it "$nio_pod" -c nio -- \
        nioctl -u "localhost:${GRPC_TLS_PORT}" --server-cn "$SERVER_CN" \
        $@
    else
      echo "could not find a running nio pod for $kind $service_name" >&2
    fi
  else
    echo "could not determine nio's GRPC TLS port"
  fi
}

vegactl() {
  local usage="usage:\nvegactl kubectl-args"
  GRPC_TLS_PORT=${VEGA_GRPC_TLS_PORT:-$(kubectl -n ves-system describe cm ver-config | grep -E '^GrpcTLSPort' | cut -d' ' -f2)}
  SERVER_CN=${VEGA_SERVER_CN:-$(kubectl -n ves-system describe cm ver-config | grep VegaCommonName | cut -d' ' -f2)}
  # echo "vega CN: $SERVER_CN" >&2
  if [[ -n "$GRPC_TLS_PORT" ]]; then
    vega_pod=$(kubectl -n ves-system get pods --no-headers -l "app=ver,cfg!=ver" | awk '{print $1}' | head -1)
    if [[ -n "$vega_pod" ]]; then
      kubectl -n ves-system exec -it "$vega_pod" -c vega -- \
        vegactl -u "localhost:${GRPC_TLS_PORT}" --server-cn "$SERVER_CN" \
        $@
    else
      echo "could not find a running vega pod" >&2
    fi
  else
    echo "could not determine vega's GRPC TLS port"
  fi
}

profile_service() {
  usage="usage:\nprofile_service service_name [environment] [pprof_type] [sample_time]"
  if [ ! -v 1 ]; then
    echo >&2 "must specify service to profile"
    echo >&2 "$usage"
    set +x
    return 1
  fi
  local service="$1"
  local environment="${2:-demo1}"
  local pprof_type="${3:-profile}"
  local sample_time="${4:-5}"
  local api_gw_hostname
  local compass_hostname
  case $environment in
    demo1)
      compass_hostname="compass-lma.demo1.volterra.us"
      api_gw_hostname="${5:-gc01.int.ves.io}"
      ;;
    crt)
      compass_hostname="compass-lma.crt.volterra.us"
      api_gw_hostname="${5:-gc01.int.ves.io}"
      ;;
    staging)
      compass_hostname="compass-lma.staging.volterra.us"
      api_gw_hostname="${5:-gc1-iad-01.int.volterra.us}"
      ;;
    *)
      echo >&2 "unknown environment $environment"
      return 1
      ;;
  esac
  output_filename="${service}.${environment}.${pprof_type}.$(date --iso-8601=seconds).pprof"
  url="https://${compass_hostname}/introspection/${api_gw_hostname}/${service}/debug/pprof/${pprof_type}?seconds=${sample_time}"
  echo "starting profile of $service on $environment (url: $url)..."
  curl \
    --insecure \
    --fail-with-body \
    --no-progress-meter \
    --cert-type P12 \
    --cert "$HOME/.ves-internal/${environment}/usercerts.p12:volterra" \
    -o "$output_filename" \
    "$url" \
    && echo "profile saved at $output_filename"
}

# kv set image statefulset/streak streak=gcr.io/volterraio/streak@sha256:37be0ca9476b754ed144da6678a414748825e733dfd0345fa3fc1924a559d42a

set-image() {
  local usage='usage: set-image resource-type resource-name image-sha'
  local resource_type="$1"
  if [[ ! -v 1 ]]; then
    echo >&2 "ERROR: resource-type is required"
    echo >&2 "$usage"
    return 1
  fi
  local resource_name="$2"
  if [[ ! -v 1 ]]; then
    echo >&2 "ERROR: resource-name is required"
    echo >&2 "$usage"
    return 1
  fi
  local container_name="$resource_name"
  local image_sha="$3"
  if [[ ! -v 1 ]]; then
    echo >&2 "ERROR: image-sha is required"
    echo >&2 "$usage"
    return 1
  fi
  if echo "$image_sha" | grep -E '^sha256:[0-9a-f]+$'; then
    image_sha="$(echo $image_sha | cut -d':' -f2)"
  fi
  if echo "$image_sha" | grep -E '^[0-9a-f]+$'; then
    echo >&2 "ERROR: invalid SHA for image: $image_sha"
    return 1
  fi
  echo "updating image for ${resource_type}/${resource_name} to sha256:${image_sha}..."
}

# get kubernetes load balancers
klb() {
  declare -a jq_args
  jq_args=(
    '["name", "clusterIP", "loadBalancerIPs", "ports", "selector"]'
    ', (.items[]|select(.spec.type=="LoadBalancer")|['
    '.metadata.name'
    ', .spec.clusterIP'
    ', (.status.loadBalancer.ingress|map(.ip)|join(", "))'
    ', (.spec.ports|map(.protocol+" "+(.port|tostring)+":"+(.targetPort|tostring)+" ("+.name+")")|join(", "))'
    ', (.spec.selector|to_entries|map(.key+"="+.value)|join("∩"))'
    '])|@tsv'
  )
  kubectl get svc $@ -o json | jq -r "$jq_args" | column -s $'\t' -t
}

# get kubernetes services
ksvc() {
  declare -a jq_args
  jq_args=(
    '["name", "clusterIP", "loadBalancerIPs", "ports", "selector"]'
    ', (.items[]|['
    '.metadata.name'
    ', .spec.clusterIP'
    ', (.status.loadBalancer.ingress//[]|map(.ip)|join(", "))'
    ', (.spec.ports|map(.protocol+" "+(.port|tostring)+":"+(.targetPort|tostring)+" ("+.name+")")|join(", "))'
    ', (.spec.selector|to_entries|map(.key+"="+.value)|join("∩"))'
    '])|@tsv'
  )
  kubectl get svc $@ -o json | jq -r "$jq_args" | column -s $'\t' -t
}

kcontainers() {
  kubectl get statefulset,deployment,daemonset -o json $@ | jq -r '.items[]|.kind+": "+.metadata.name+": "+([.spec.template.spec.containers[]|.name]|sort|join(", "))'| column -s':' -t
}
