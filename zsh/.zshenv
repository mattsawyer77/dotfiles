export LANG=en_US.UTF-8
export GOPATH=~/gocode
export GO111MODULE=on
export EDITOR="emacsclient -t -a 'emacs -nw'"
export VISUAL=$EDITOR
export FZF_DEFAULT_COMMAND='ag -g ""'
export BAT_THEME=1337
export NVM_DIR="$HOME/.nvm"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#556677"
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

export LESS='-F -i -M -R -X --incsearch'
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
command -v bat >/dev/null && export MANPAGER="sh -c 'col -bx | bat -p -lman --color=always'"
if [ -e /Users/sawyer/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/sawyer/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
if [ -e /Users/matt/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/matt/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
source "$HOME/.cargo/env"
