#!/usr/bin/env zsh
bindkey -v

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
# export EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias em='emacsclient -t -c --alternate-editor=""'

alias zenith="sudo -E zenith --disk-height 0"
alias clippy='touch $(git rev-parse --show-toplevel)/src/main.rs && cargo clippy --color=always 2>&1 | less'

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
# zplug "plugins/kubectl", from:oh-my-zsh, defer:1
zplug "plugins/tmux", from:oh-my-zsh, defer:1
zplug "plugins/terraform", from:oh-my-zsh, defer:1
zplug "plugins/stack", from:oh-my-zsh, defer:1
zplug "plugins/rustup", from:oh-my-zsh, defer:1
zplug "zdharma/zsh-diff-so-fancy", as:command, use:"bin/", defer:1
zplug "zsh-users/zsh-syntax-highlighting", defer:2
# #compdef cargo
# source $(rustc --print sysroot)/share/zsh/site-functions/_cargo

# Then, source plugins and add commands to $PATH
zplug load

command -v aws_completer >/dev/null && complete -C "$(which aws_completer)" aws
source <(kubectl completion zsh)
complete -F __start_kubectl k

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
# to keep a command from being stored in history, lead it with a space
setopt HIST_IGNORE_SPACE
export SAVEHIST=5000
export HISTSIZE=100000

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export AWS_SDK_LOAD_CONFIG=1
export AWS_DEFAULT_PROFILE=f5cs
export SAML2AWS_USER_AGENT="Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:82.Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:82.0) Gecko/20100101 Firefox/82.00) Gecko/20100101 Firefox/82.0"
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
# export EMACS="/Applications/Emacs.app/Contents/MacOS/Emacs"
alias em='emacsclient -t -c --alternate-editor=""'

alias zenith="sudo -E zenith --disk-height 0"
alias clippy='touch $(git rev-parse --show-toplevel)/src/main.rs && cargo clippy --color=always 2>&1 | less'

if [ -n "${commands[fzf-share]}" ]; then
  source "$(fzf-share)/key-bindings.zsh"
  source "$(fzf-share)/completion.zsh"
fi

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# export PATH="/usr/local/opt/llvm/bin:$PATH"

# nix
test -f ~/.nix-profile/etc/profile.d/nix.sh \
  && source ~/.nix-profile/etc/profile.d/nix.sh
export NIXPKGS_ALLOW_UNFREE=1
