#!/usr/bin/env zsh
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="fletcherm"
# ZSH_THEME=agnoster
# ZSH_THEME=avit
ZSH_THEME="avit-p4"
# ZSH_THEME=mh
# ZSH_THEME=muse
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git perforce brew node npm tmux vi-mode gulp zsh-syntax-highlighting, mix)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias l='ls -alFG'
alias p4file='pcregrep "^\/\/depot" | sed "s@//depot/[a-z-]*/[a-z-]*/@@" | cut -d" " -f1 | cut -d"#" -f1'
alias p4cl='p4 opened 2>&1 | grep change | pcregrep -v "default change|change default" | awk "{ print \$5 }" | sort -u | xargs p4 describe -s | grep -A2 "^Change" | grep "^."'
alias glo='git log --format="%C(auto,yellow)%<(20)%cr%C(auto,cyan) %s"'
alias glocl='git log --format="%s"'
alias vim=nvim
alias neovim='open -a /Applications/Neovim.app/Contents/MacOS/Neovim --args'
export P4CONFIG=.p4config
export P4USER=sawyer
export P4IGNORE=.p4ignore
export P4DIFF=/usr/local/bin/ksdiff
export P4MERGE=/usr/local/bin/ksdiff
export GOPATH=~/gocode
# export EDITOR='mvim -f --nomru -c "au VimLeave * !open -a Terminal"'
export EDITOR='/usr/local/bin/nvim'
export HOMEBREW_GITHUB_API_TOKEN=0c7834f095d501008bee069310957dbfbdf5bf49
export PATH="node_modules/.bin:$HOME/.tmuxifier/bin:$HOME/Library/Python/2.7/bin:$HOME/.cabal/bin:/usr/local/opt/php55:$GOPATH/bin:/usr/local/sbin:/usr/local/bin:/Users/sawyer/.local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"
export LESS="-X -R -i"
export TERM=xterm-256color
export XDG_DATA_HOME=~/.local/share
export XDG_CONFIG_HOME=~/.config
DISABLE_AUTO_TITLE=true

bindkey -v

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

ulimit -n 4096

# powerline-daemon -q
# source $HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

p4clientRoot () {
    p4 info | grep 'Client root' | awk '{ print $3 }'
}

p4clientName () {
    p4 info | grep 'Client name' | awk '{ print $3 }'
}

p4log () {
   p4 changes -i $@ | awk '{print $2}' | xargs -I{} p4 describe -du {} | less -FirX
}

p4logShort () {
   p4 changes -i $@ | awk '{print $2}' | xargs -I{} p4 describe -sdu {} | less -FirX
}

p4opened () {
    client_root="$(p4clientRoot)"
    client_name="$(p4clientName)"
    p4 -ztag opened "$@" | grep clientFile | awk '{ print $3 }'| sed "s@//${client_name}/@${client_root}/@" | sed "s@$(pwd)/@@"
}

p4clFiles () {
    IFS=$'\n'
	changelists=($(p4 -ztag opened | grep '... change' | awk '{print $3;}' | sort -u))
	for cl in $changelists; do 
		if [[ $cl -eq "default" ]]; then
			echo default changelist:
		else
			p4 describe -s $cl | grep -A2 "^Change" | grep "^."
		fi
		p4 opened -c $cl | p4file | sed 's/^/        /'
		echo
	done
}

p4openedDeleted () {
    client_root="$(p4clientRoot)"
    client_name="$(p4clientName)"
    p4 -ztag opened "$@" | pcregrep -B4 'delete' | grep clientFile | awk '{ print $3 }'| sed "s@//${client_name}/@${client_root}/@" | sed "s@$(pwd)/@@"
}
p4openedNonDeleted () {
    client_root="$(p4clientRoot)"
    client_name="$(p4clientName)"
    p4 -ztag opened "$@" | pcregrep -B4 'integrate|branch|edit|add|move/add' | grep clientFile | awk '{ print $3 }'| sed "s@//${client_name}/@${client_root}/@" | sed "s@$(pwd)/@@"
}

p4blame () {
    IFS=$'\n'
    # hash of changelist # to changelist author
    typeset -A changelists
    annotate_output=($(p4 annotate -I $* | pcregrep '^\d+:'))

    if [ -n "$annotate_output" ]; then
        for line in $annotate_output; do
            changelist_number="$(echo $line | cut -d':' -f1)"
            if [[ $changelists[$changelist_number] ]]; then
                changelist_author=$changelists[$changelist_number]
            else
                changelist_author="$(p4 describe -s $changelist_number | grep ^Change | cut -d' ' -f4 | cut -d'@' -f1)"
                changelists[$changelist_number]=${changelist_author}
            fi
            echo "${changelist_author}:${line}"
        done
    fi
}

p4patch () {
    if [ -z "$1" ]; then
        echo ERROR: must specify a reviewboard-generated patch file.
        return 1
    fi
    patch_file="$1"
    p4_prefix='//depot/bigiq/mgmt/'

    if [ -n "$2" ]; then
        p4_prefix="$2"
        if [ ! $(echo $p4_prefix | pcregrep '/$') ]; then
            p4_prefix="${p4_prefix}/"
        fi
    fi

    # get a list of files in the patch
    files=($(grep "$p4_prefix" $patch_file | awk '{ print $2; }' | sed "s@${p4_prefix}@@g" | sort -u))

    for file in $files; do
        if [ ! -f "$file" ]; then
            echo "ERROR: file $file does not exist in this workspace"
            return 1
        fi
    done

    echo "opening files in perforce..."
    for file in $files; do
        p4 edit $file || (echo "ERROR: could not p4 edit $file"; return 1)
    done

    # strip out the depot prefix
    perl -pi -e "s@${p4_prefix}@@g" $patch_file || return 1

    patch -p0 < $patch_file
}

p4revert () {
    find $(p4opened) -ok p4 revert "{}" \;
}

p4reconcile () {
	find $(p4 reconcile -n $1 | p4file) -ok p4 reconcile "{}" \;
}

# NVM
source ~/.nvm/nvm.sh
nvm use default

# tmuxifier
eval "$(tmuxifier init -)"

# z
source `brew --prefix`/etc/profile.d/z.sh

# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rustup
source $HOME/.cargo/env

# haskell stack
# export HASKELL_STACK_HOME=~/.stack
# export PATH=$HASKELL_STACK_HOME/snapshots/x86_64-osx/lts-3.20/7.10.2/bin:$HASKELL_STACK_HOME/programs/x86_64-osx/ghc-7.10.2/bin:$PATH