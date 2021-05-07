#!/usr/bin/env zsh
bindkey -v
# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

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
setopt INC_APPEND_HISTORY
export SAVEHIST=100000
# to keep a command from being stored in history, lead it with a space
setopt HIST_IGNORE_SPACE
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
export BUILDDIR=/tmp/makepkg
export TZ=America/Los_Angeles
export SAML2AWS_USER_AGENT="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:82.Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:82.0) Gecko/20100101 Firefox/82.00) Gecko/20100101 Firefox/82.0"
if command -v pyenv >/dev/null; then
  eval "$(pyenv init -)"
fi
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
alias tl='tmux list-sessions'
alias k=kubectl
# edit a file with emacsclient -- if no session exists, create one automatically
# export EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias em='emacsclient -t -c --alternate-editor=""'
alias zenith="sudo -E zenith --disk-height 0"
alias ssh='TERM=xterm-256color ssh'
alias k=kubectl
if command -v exa >/dev/null; then
  alias l='exa -alF'
else
  alias l='ls -alFG'
fi
alias zenith="sudo -E zenith --disk-height 0"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

rust-analyzer-upgrade() {
  if [[ -v 1 ]]; then
    RA_VERSION="$1"
    echo "checking rust-analyzer releases for version ${RA_VERSION}..."
    RELEASE=$(curl -SsH "Accept: application/vnd.github.v3+json" \
      https://api.github.com/repos/rust-analyzer/rust-analyzer/releases \
      | jq -r '.[]|select(.tag_name=="'"$RA_VERSION"'")')
    if [[ -n "$RELEASE" ]]; then
      RA_URL=$(echo "$RELEASE" \
        | jq -r '.assets[]|select(.name=="rust-analyzer-linux")|.browser_download_url' \
        | sort -r \
        | head -1) || echo "something went wrong"
    else
      echo >&2 "could not find a release for $RA_VERSION"
    fi
  else
    echo "querying rust-analyzer releases to find the latest version..."
    RA_URL=$(curl -SsfH "Accept: application/vnd.github.v3+json" \
      https://api.github.com/repos/rust-analyzer/rust-analyzer/releases \
      | jq -r '.[]|select(.prerelease==false)|.assets[]|select(.name=="rust-analyzer-linux")|.browser_download_url' \
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
# nix
export NIXPKGS_ALLOW_UNFREE=1

printf '\e]2;'$(hostname)'\a'
