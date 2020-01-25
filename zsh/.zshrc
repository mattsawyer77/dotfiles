#!/usr/bin/env zsh

# install zplugin if not already installed
if [[ ! -d ~/.zplugin ]]; then
   mkdir ~/.zplugin
   (git clone https://github.com/zdharma/zplugin.git ~/.zplugin/bin \
     && source ~/.zplugin/bin/zplugin.zsh \
     && zplugin self-update \
     && exec zsh) \
     || echo 2> "error: could not clone/install zplugin..."
fi

bindkey -v
source ~/.zplugin/bin/zplugin.zsh
autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

zplugin ice pick"async.zsh" src"pure.zsh"; zplugin light sindresorhus/pure

zplugin ice as"program" atclone"rm -f src/auto/config.cache; ./configure" \
    atpull"%atclone" make pick"src/vim"
zplugin light vim/vim

zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
zplugin light trapd00r/LS_COLORS

export ZSH_CACHE_DIR=~/.local/cache
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

# OMZ things to source
local _ZSHRC_OMZ_SOURCES=(
  lib/compfix.zsh
  lib/completion.zsh
  lib/history.zsh
  lib/key-bindings.zsh
  lib/spectrum.zsh
  lib/termsupport.zsh
  # lib/theme-and-appearance.zsh

  # plugins/osx/osx.plugin.zsh
  # plugins/git/git.plugin.zsh
)

zplugin ice from"gh" pick"lib/git.zsh" nocompletions blockf lucid \
  atload'!local f; for f in ${_ZSHRC_OMZ_SOURCES}; do source $f; done' \
  compile"(${(j.|.)_ZSHRC_OMZ_SOURCES})"
zplugin load robbyrussell/oh-my-zsh

zplugin ice wait"0" lucid; zplugin snippet OMZ::plugins/aws/aws.plugin.zsh
zplugin ice wait"0" lucid; zplugin snippet OMZ::plugins/kubectl/kubectl.plugin.zsh
zplugin ice wait"0" lucid; zplugin snippet OMZ::plugins/tmux/tmux.plugin.zsh
zplugin ice wait"0" lucid; zplugin snippet OMZ::plugins/terraform/terraform.plugin.zsh
zplugin ice wait"0" lucid; zplugin snippet OMZ::plugins/stack/stack.plugin.zsh
zplugin ice wait"0" lucid blockf; zplugin light zsh-users/zsh-completions
zplugin ice from"gh-r" as"program"; zplugin load junegunn/fzf-bin
zplugin ice wait"0" lucid atload"_zsh_autosuggest_start"; zplugin light zsh-users/zsh-autosuggestions
zplugin ice wait"0" lucid atinit"zpcompinit; zpcdreplay"; zplugin light zdharma/fast-syntax-highlighting

zstyle :prompt:pure:path color 242
zstyle :prompt:pure:git:branch color cyan

source `brew --prefix`/etc/profile.d/z.sh

# vi style incremental search
bindkey -v
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[[ -e "$HOME/.fzf-extras/fzf-extras.zsh" ]] \
  && source "$HOME/.fzf-extras/fzf-extras.zsh"

ulimit -n 4096

alias ssh='TERM=xterm-256color ssh'
alias vim=nvim
alias socks4proxy='ssh -D 8888 -f -C -q -N'
alias randomizeMacAddress="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"
alias k=kubectl
if which exa >/dev/null; then
  alias l='exa -alF'
else
  alias l='ls -alFG'
fi
alias ts='tmux new-session -n main -s'
alias ta='tmux attach -t'
alias k=kubectl
alias tf-apply='time terraform apply .plan 2>&1 | tee apply.out'
alias tf-plan='terraform plan -out=.plan 2>&1 | tee plan.out'

# update an app's icon with the specified icns file
update-icon() {
  echo "read 'icns' (-16455) \"$1\";" > tmpicns.rsrc
  Rez -a tmpicns.rsrc -o $2/Icon$'\r'
  SetFile -a C $2; SetFile -a V $2/Icon$'\r'; rm tmpicns.rsrc
}

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

# edit a file with emacsclient -- if no session exists, create one automatically
alias em='emacsclient --nw -c -a emacs -nw "$@"'
