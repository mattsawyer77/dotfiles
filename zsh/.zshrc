#!/usr/bin/env zsh
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose false
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="fletcherm"
# ZSH_THEME=agnoster
# ZSH_THEME=avit
# ZSH_THEME="avit-p4"
# ZSH_THEME=mh
# ZSH_THEME=muse
# ZSH_THEME=sawyer
# ZSH_THEME=fishy
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vcs)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch git-tagname)
POWERLEVEL9K_DIR_HOME_BACKGROUND="grey30"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="grey30"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="grey30"
POWERLEVEL9K_DIR_ETC_BACKGROUND="grey30"
POWERLEVEL9K_DIR_HOME_FOREGROUND="lightcyan1"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="lightcyan1"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="lightcyan1"
POWERLEVEL9K_DIR_ETC_FOREGROUND="lightcyan1"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='lightcyan1'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='lightblue'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='yellow'
POWERLEVEL9K_NVM_BACKGROUND='grey30'
POWERLEVEL9K_NVM_FOREGROUND='chartreuse1'

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
plugins=(aws git kubectl kubetail helm tmux vi-mode docker docker-compose stack zsh-autosuggestions zsh-syntax-highlighting terraform)

source $ZSH/oh-my-zsh.sh

# User configuration

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias l='ls -alFG'
alias ls='exa'
alias l='exa -alF'
alias ssh='TERM=xterm-256color ssh'
alias p4file='pcregrep "^\/\/depot" | sed "s@//depot/[a-z-]*/[a-z-]*/@@" | cut -d" " -f1 | cut -d"#" -f1'
alias p4cl='p4 opened 2>&1 | grep change | pcregrep -v "default change|change default" | awk "{ print \$5 }" | sort -u | xargs p4 describe -s | grep -A2 "^Change" | grep "^."'
alias glo='git log --format="%C(auto,yellow)%<(20)%cr%C(auto,cyan) %s"'
alias glocl='git log --format="%s"'
alias vim=nvim
alias elm-repl="elm repl"
alias socks4proxy='ssh -D 8888 -f -C -q -N'
alias randomizeMacAddress="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig en0 ether"
alias ts='tmux new-session -n main -s'
alias k=kubectl
alias doom='~/.emacs.d/bin/doom run -nw'
get-sa-token() {
    context=$1
    secret=$(kubectl --context "$context" -n kube-system get secret \
        | grep f5aas- \
        | awk '{print $1}')
    kubectl --context "$context" -n kube-system describe secret "$secret" \
        | pcregrep '^token:' \
        | awk '{print $2}'
}

# TMUX remote server aliases that customize background color
export DEFAULT_BACKGROUND_COLOR="$(pcregrep '^\s*background:' ~/dotfiles/alacritty/alacritty.yml | head -1 | cut -d\' -f2 | sed 's/0x/#/')"
alias bigiq1="TERM=xterm-256color tmux-color-command bigiq1 'bg=#58825c fg=#e3ebe7' ssh"
alias bigiq2="TERM=xterm-256color tmux-color-command bigiq2 'bg=#d8d19e fg=#3f4422' ssh"
alias bigip2="TERM=xterm-256color tmux-color-command bigip2"
alias bigiq3="TERM=xterm-256color tmux-color-command bigiq3"
alias sawyer-dev="TERM=xterm-256color tmux-color-command sawyer-dev 'bg=#161e23 fg=#bac9cc' et"
alias f5aas-ops="TERM=xterm-256color tmux-color-command f5aas-ops 'bg=#465a4e fg=#d0dad4' mosh --"
alias seadev02="TERM=xterm-256color tmux-color-command seadev02 'bg=#161e53 fg=#bac9cc' mosh --no-init --"
DISABLE_AUTO_TITLE=true

bindkey -v

# vi style incremental search
bindkey '^R' history-incremental-search-backward
bindkey '^S' history-incremental-search-forward
bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

ulimit -n 4096

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
    annotate_output=($(p4 annotate -i $* | pcregrep '^\d+:'))

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
# nvm use default


# tmuxifier
eval "$(tmuxifier init -)"

# z
source `brew --prefix`/etc/profile.d/z.sh

# FZF
export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rustup
source $HOME/.cargo/env

# tokens
source $HOME/tokens

# OPAM configuration
# . /Users/sawyer/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
