{ config,
  lib,
  pkgs ? import <nixpkgs> { localSystem = "aarch64-darwin"; },
  ...
}:
let pkgs_x86_64 = import <nixpkgs> { localSystem = "x86_64-darwin"; };
    in
{
  nixpkgs.config.allowUnfree = true;
  users.nix.configureBuildUsers = true;
  environment.systemPackages = [
    # pkgs.aws-iam-authenticator
    # pkgs.awscli2
    # pkgs.emacs
    # pkgs.emacsGit
    # pkgs.emacsMacport
    # pkgs_x86_64.cabal-install
    # pkgs_x86_64.ghc
    # pkgs_x86_64.ghcid
    # pkgs_x86_64.haskell-language-server
    # pkgs_x86_64.libvterm # not working on ARM yet
    # pkgs_x86_64.ormolu
    # pkgs_x86_64.stack
    pkgs.alacritty
    pkgs.automake
    pkgs.bash_5
    pkgs.bat
    pkgs.bat-extras.batman
    pkgs.cachix
    pkgs.cairo
    pkgs.cask
    pkgs.cloc
    pkgs.cmake
    pkgs.coreutils
    pkgs.curlFull
    pkgs.diff-so-fancy
    # pkgs.docker-machine-hyperkit
    pkgs.dos2unix
    # pkgs.emacsGcc
    pkgs.emacsUnstableGcc
    pkgs.exa
    pkgs.fd
    pkgs.fx
    pkgs.flamegraph
    pkgs.fontconfig
    pkgs.freetype
    pkgs.fzf
    pkgs.gdb
    pkgs.gdbm
    pkgs.ghostscript
    pkgs.glib
    pkgs.gmp6
    pkgs.gnumake
    pkgs.gnupg
    pkgs.go
    pkgs.golangci-lint
    pkgs.gopls
    pkgs.google-cloud-sdk
    pkgs.graphviz
    pkgs.grpcurl
    # pkgs.handbrake
    pkgs.harfbuzzFull
    pkgs.helix
    pkgs.htop
    pkgs.httrack
    pkgs.jansson
    # pkgs.jdk
    # pkgs.jre
    pkgs.jq
    pkgs.kubectl
    # pkgs.libressl
    # pkgs.lua5_4
    # pkgs.lua5_1
    pkgs.luajit
    # pkgs.lua51Packages
    pkgs.less
    pkgs.libiconv
    pkgs.libgccjit
    pkgs.libsndfile
    pkgs.libssh2
    pkgs.libtool
    pkgs.libvterm-neovim
    pkgs.libxml2
    pkgs.llvmPackages_12.lldb
    pkgs.llvm_12
    pkgs.most
    pkgs.msgpack
    pkgs.ncurses
    pkgs.neovim # customized in ./neovim.nix overlay
    pkgs.netcat
    pkgs.netperf
    pkgs.ninja
    # pkgs.nixUnstable
    pkgs.nmap
    pkgs.nodejs
    pkgs.oniguruma
    # pkgs.openapi-generator-cli
    pkgs.openldap
    pkgs.openssl
    # pkgs.openssl_1_1
    pkgs.pandoc
    pkgs.pcre
    pkgs.pcre2
    pkgs.pkg-config
    pkgs.pkgconfig
    pkgs.podman
    pkgs.protobuf3_11
    pkgs.python39
    # pkgs.python39Packages.cfn-lint
    # pkgs.python39Packages.pyopenssl
    pkgs.readline
    pkgs.reattach-to-user-namespace
    pkgs.redis
    pkgs.ripgrep
    pkgs.rnix-lsp
    pkgs.rust-analyzer
    pkgs.rustup
    pkgs.sd
    pkgs.shared-mime-info
    pkgs.sqlite
    pkgs.starship
    pkgs.taglib
    pkgs.terraform-ls
    pkgs.tflint
    pkgs.tmux
    pkgs.tree
    # pkgs.tree-sitter # too new for emacs right now?
    pkgs.unixtools.watch
    # pkgs.wasm-pack
    pkgs.wget
    pkgs.xsv
    # pkgs.yabai
    pkgs.yaml-language-server
    pkgs.youtube-dl
    pkgs.yq-go
    pkgs.zlib
    pkgs.zoxide
    pkgs.zsh
    pkgs.zsh-autosuggestions
    pkgs.zsh-syntax-highlighting
    pkgs.zsh-z
    pkgs.zstd
    # pkgs_x86_64.glibc
    # pkgs_x86_64.cachix
    # pkgs_x86_64.eternal-terminal
    # pkgs_x86_64.handbrake
    # pkgs_x86_64.pandoc
    # pkgs_x86_64.pinentry
    # pkgs_x86_64.shellcheck
    # pkgs_x86_64.skhd
    # pkgs_x86_64.ssm-session-manager-plugin
    # pkgs_x86_64.ttfautohint
    # pkgs_x86_64.upx
    # pkgs_x86_64.wireshark
    pkgs_x86_64.yabai
    # pkgs_x86_64.zenith
  ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      # url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
      # url = https://github.com/mjlbach/emacs-overlay/archive/feature/flakes.tar.gz;
      # url = https://github.com/nix-community/emacs-overlay/archive/927a75170f789a464e2b59c9913539e071fdc1cb.tar.gz;
      url = https://github.com/nix-community/emacs-overlay/archive/ca40aa5bf94bab92db1e5dc69e2218239186a8ea.tar.gz;
    }))
    (import ./neovim.nix)
  ];

  # workaround for annoying warning bug: https://github.com/LnL7/nix-darwin/issues/145
  nix.nixPath = pkgs.lib.mkForce [{
    darwin-config = builtins.concatStringsSep ":" [
      "$HOME/.nixpkgs/darwin-configuration.nix"
      "$HOME/.nix-defexpr/channels"
    ];
  }];

  # nix.package = pkgs.nixUnstable;
  nix.package = pkgs.nixFlakes;
  # nix.useDaemon = true;
  nix.extraOptions = ''
    extra-platforms = x86_64-darwin aarch64-darwin
    experimental-features = nix-command flakes
  '';

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;
  # services.yabai.enable = true;
  # services.yabai.package = pkgs.yabai;
  # services.skhd.enable = true;

  programs.tmux.extraConfig = ''
      # remap prefix to Control + space
      unbind C-b
      set -g mode-keys vi
      bind-key -T copy-mode-vi 'v' send -X begin-selection
      bind-key -T copy-mode-vi 'y' send -X copy-selection-and-cancel
      set -g prefix C-Space
      set -g base-index 1
      bind Space send-prefix
      bind-key j command-prompt -p "join pane from:"  "join-pane -hs '%%'"
      bind-key s choose-tree
      bind-key b break-pane
      bind-key c command-prompt -p "new window name:" "new-window -n '%%'"
      bind-key BSpace send-keys " clear && tmux clear-history" \; send-keys "Enter"
      bind-key -n S-Up set-option -g status on
      bind-key -n S-Down set-option -g status off
      bind-key -n S-Left previous-window
      bind-key -n S-Right next-window
      bind-key f3 next-layout
      bind-key -n M-J resize-pane -D 5
      bind-key -n M-K resize-pane -U 5
      bind-key -n M-H resize-pane -L 5
      bind-key -n M-L resize-pane -R 5
      bind -n M-Left select-pane -L
      bind -n M-Right select-pane -R
      bind -n M-Up select-pane -U
      bind -n M-Down select-pane -D

      # set -g default-terminal "xterm-24bit"
      # set -ga terminal-overrides ",xterm-24bit:Tc"
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",alacritty:Tc"
      set -g automatic-rename off
      set -g focus-events on
      set -g -q mode-mouse on
      set -g -q mouse-resize-pane on
      set -g -q mouse on
      bind -n WheelUpPane if-shell -F -t = "#{mouse_any_flag}" "send-keys -M" "if -Ft= '#{pane_in_mode}' 'send-keys -M' 'copy-mode -e'"
      set -g history-limit 50000
      set -g escape-time 10

      # set pane colors - hilight the active pane
      set -g pane-border-style fg=colour235,bg=black
      set -g pane-active-border-style fg=colour240,bg=black

      # ----------------------
      # Status Bar
      # -----------------------
      set -g status on                       # turn the status bar on
      set -g status-interval 30              # set update frequencey (default 15 seconds)
      set -g status-justify left             # center window list for clarity
      set -g message-style bg=black,fg=green
      set -g status-style bg="#2c2c34",fg=yellow
      set -g window-status-format "  #{window_index}|#{window_name}  "
      set -g window-status-style fg="#888899",bg="#383845"
      set -g window-status-last-style fg="#888899",bg="#383845"
      set -g window-status-current-format "  #{window_index}|#{window_name}  "
      set -g window-status-current-style fg="#ccccdd",bg="#4f4f58"

      set -g status-left-length 70
      set -g status-left "#[bg=#336688]#[fg=#eeeeee] #h #[bg=#113355]#[fg=brightwhite]#{?client_prefix,#[bg=green],} #S "

      set -g status-right-length 60
      # set -g status-right "#[bg=#444455]#[fg=#bbbbcc] %H:%M "
      set -g status-right ""

      if-shell 'test "$(uname)" = "Darwin"' "source-file ~/.tmux-osx.conf"
  '';

  programs.zsh.enable = true;  # default shell on catalina+
  programs.zsh.enableCompletion = false; # broken, see https://github.com/LnL7/nix-darwin/issues/373
  programs.zsh.enableBashCompletion = true;
  programs.zsh.enableFzfCompletion = true;
  programs.zsh.enableFzfGit = true;
  programs.zsh.enableFzfHistory = true;
  programs.zsh.enableSyntaxHighlighting = true;
  # programs.zsh.autosuggestions.enable = true; # only available on nixos?
  environment.variables = {
    SAVEHIST = "5000";
    HISTSIZE = "100000";
    LC_ALL = "en_US.UTF-8";
    LANG = "en_US.UTF-8";
    LANGUAGE = "en_US.UTF-8";
    GOPATH = "$HOME/gocode";
    GO111MODULE = "on";
    BAT_THEME = "1337";
    LESS = "-F -i -M -R -X --incsearch";
  };
  environment.shellAliases = {
    ssh = "TERM=xterm-256color ssh";
    socks4proxy = "ssh -D 8888 -f -C -q -N";
    randomizeMacAddress = "openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//' | xargs sudo ifconfig $(route -n get default | grep interface: | cut -d':' -f2 | awk '{print $1}') ether";
    k = "kubectl";
    l = "exa -alF";
    ts = "tmux new-session -n main -s";
    ta = "tmux attach -t";
    tl = "tmux list-sessions";
    em = "em.zsh";
    doom = "~/.emacs.d/bin/doom";
  };
   programs.zsh.promptInit = ''
     eval "$(starship init zsh)"
   '';
   # TODO: investigate syntax highlighting and autosuggestions, which aren't loading right now
   programs.zsh.interactiveShellInit = ''
     bindkey -v

     # currently required due to https://github.com/LnL7/nix-darwin/issues/373
     autoload -U compinit && compinit
     # compdef cargo
     # source $(rustc --print sysroot)/share/zsh/site-functions/_cargo
 
     # ulimit -n 200000
     # ulimit -u 4096
 
     zstyle ':completion:*:*:*:*:*' menu select
 
     setopt APPEND_HISTORY
     setopt EXTENDED_HISTORY
     setopt HIST_EXPIRE_DUPS_FIRST
     setopt HIST_IGNORE_DUPS
     setopt HIST_FIND_NO_DUPS
     setopt HIST_REDUCE_BLANKS
     setopt HIST_IGNORE_SPACE

     alias ssh='TERM=xterm-256color ssh'
     alias socks4proxy='ssh -D 8888 -f -C -q -N'
     alias k='kubectl'
     alias l='exa -alF'
     alias ts='tmux new-session -n main -s'
     alias ta='tmux attach -t'
     alias tl='tmux list-sessions'
     alias em='em.zsh'
     alias doom='~/.emacs.d/bin/doom'
     if command -v exa >/dev/null; then
       alias l='exa -alF'
     else
       alias l='ls -alFG'
     fi
 
     if command -v em.zsh >/dev/null; then
       export EDITOR=em.zsh
       export VISUAL=em.zsh
     else
       export EDITOR=nvim
       export VISUAL=nvim
     fi
 
     if [ -n "$${commands[fzf-share]}" ]; then
       source "$(fzf-share)/key-bindings.zsh"
       source "$(fzf-share)/completion.zsh"
     fi
 
     eval "$(zoxide init zsh)"

     rust-analyzer-upgrade() {
       if [[ -v 1 ]]; then
         RA_VERSION="$1"
         echo "checking rust-analyzer releases for version $${RA_VERSION}..."
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
         echo "installing rust-analyzer from $${RA_URL}..."
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
           plist=($(find /Library/Launch* ~/Library/LaunchAgents -name "$${service}.plist" | head -1 || :))
           echo "stopping service $${service}..."
           launchctl unload "$plist" \
             && echo "service $${service} stopped, restarting..." \
             && launchctl load "$plist" \
             && echo "service $${service} restarted successfully."
         done
       else
         echo >&2 "must specify a pattern for a service to restart"
       fi
 
     }
     export PATH=~/.local/bin:~/.cargo/bin:$PATH
   '';

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
