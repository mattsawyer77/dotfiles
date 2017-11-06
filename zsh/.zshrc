#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
#
# Archlinux plugin
#### pacaur
# Alias        Command                             | Description
# Install packages from the repositories
alias pain='pacaur -S'
# Install a package from a local file
alias pains='pacaur -U'
# Install packages as dependencies of another package
alias painsd='pacaur -S --asdeps'
# Display information about a package in the local database
alias paloc='pacaur -Qi'
# Search for packages in the local database
alias palocs='pacaur -Qs'
# List installed packages including from AUR (tagged as "local")
alias palst='pacaur -Qe'
# Force refresh of all package lists after updating mirrorlist
alias pamir='pacaur -Syy'
# Remove orphans using pacaur
alias paorph='pacaur -Qtd'
# Remove packages, keeping its settings and dependencies
alias pare='pacaur -R'
# Remove packages, including its settings and unneeded dependencies
alias parem='pacaur -Rns'
# Display information about a package in the repositories
alias parep='pacaur -Si'
# Search for packages in the repositories
alias pareps='pacaur -Ss'
# Update and refresh local package, ABS and AUR databases
alias paupd='pacaur -Sy && sudo abs && sudo aur'
# Update and refresh the local package and ABS databases
alias paupd='pacaur -Sy && sudo abs'
# Update and refresh the local package and AUR databases
alias paupd='pacaur -Sy && sudo aur'
# Update and refresh the local package database
alias paupd='pacaur -Sy'
# Sync with repositories before upgrading all packages (from AUR too)
alias paupg='pacaur -Syua'
# Same as `paupg`, but without confirmation
alias pasu='pacaur -Syua --no-confirm'
# Sync with repositories before upgrading packages
alias upgrade='pacaur -Syu'

#### pacman
# Alias             Command                                  | Description
# Install packages from the repositories
alias pacin='sudo pacman -S'
# Install a package from a local file
alias pacins='sudo pacman -U'
# Install packages as dependencies of another package
alias pacinsd='sudo pacman -S --asdeps'
# Display information about a package in the local database
alias pacloc='pacman -Qi'
# Search for packages in the local database
alias paclocs='pacman -Qs'
# List all orphaned packages
alias paclsorphans='sudo pacman -Qdt'
# Force refresh of all package lists after updating mirrorlist
alias pacmir='sudo pacman -Syy'
# Remove packages, keeping its settings and dependencies
alias pacre='sudo pacman -R'
# Remove packages, including its settings and dependencies
alias pacrem='sudo pacman -Rns'
# Display information about a package in the repositories
alias pacrep='pacman -Si'
# Search for packages in the repositories
alias pacreps='pacman -Ss'
# Delete all orphaned packages
alias pacrmorphans='sudo pacman -Rs $(pacman -Qtdq)'
# Update and refresh the local package, ABS and AUR databases
alias pacupd='sudo pacman -Sy && sudo abs && sudo aur'
# Update and refresh the local package and ABS databases
alias pacupd='sudo pacman -Sy && sudo abs'
# Update and refresh the local package and AUR databases
alias pacupd='sudo pacman -Sy && sudo aur'
# Update and refresh the local package database
alias pacupd='sudo pacman -Sy'
# Sync with repositories before upgrading packages
alias pacupg='sudo pacman -Syu'
# Sync with repositories before upgrading packages
alias upgrade='sudo pacman -Syu'
# Download fresh package databases from the server
alias pacfileupg='sudo pacman -Fy'
# Search package file names for matching strings.
alias pacfiles='pacman -Fs'

# tmux aliases
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# general aliases
alias ls=exa
alias l='ls -alF'
alias mountbuild='sudo mount -t cifs -o ro,soft,noauto,nosuid,username=sawyer,workgroup=olympus //wendy/build /build'

# general
export EDITOR=nvim
export VISUAL=nvim

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
export PATH=node_modules/.bin:$PATH

# perforce
export P4CONFIG=.p4config
export P4IGNORE=.p4ignore

# custom shell functions:
function p4cl() {
	p4 -ztag -F'%change%' opened | sort -u | xargs -I{} zsh -c "p4 -ztag -F'%change%: %desc%' describe -s {} | head -1"
}
function p4clFiles() {
	p4 -ztag -F'%change%' opened | sort -u | xargs -I{} zsh -c "p4 -ztag -F'%change%: %desc%' describe -s {} | head -1 | pcregrep --color '.*'; p4 -ztag -F'%clientFile%' opened -c {} | sed s@//$(p4 -ztag -F'%clientName%' info)/@@; echo"
}
function p4reconcile () {
	old_IFS=$IFS
	IFS=$'\n'
	files=($(p4 -ztag -F'%clientFile%' reconcile -n "$1"))
	for file in $files; do
		echo -n "p4 reconcile $file? "
		read answer
		if [[ $answer == "y" ]] || [[ $answer == 'Y' ]]; then
			p4 reconcile "$file"
		else
			echo "skipping $file"
		fi
	done
	IFS=$old_IFS
}
