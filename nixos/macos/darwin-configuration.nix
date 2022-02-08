{ config, pkgs, ... }:

let customPackages = [ (pkgs.callPackage ./openfortivpn/default.nix { }) ];
in {
  # workaround for https://github.com/NixOS/nixpkgs/issues/77503
  # nixpkgs.config.permittedInsecurePackages = [
  #   "openssl-1.0.2u"
  # ];
  users.nix.configureBuildUsers = true;
  environment.systemPackages = with pkgs;
    [
      # ccls
      # git # nix git doesn't support macos keychain
      # go
      # handbrake
      # libressl
      # pinentry # broken as of 2022-01-04
      # procs
      # python39Packages.cfn-lint
      # rnix-lsp
      # vgo2nix
      alacritty
      automake
      aws-iam-authenticator
      awscli2
      azure-cli
      bash_5
      bat
      boost
      cachix
      cairo
      cloc
      cmake
      coreutils
      curlFull
      delve
      diff-so-fancy
      direnv
      docker
      dos2unix
      emacsGcc
      etcd
      # eternal-terminal # broken as of 2022-02-07
      exa
      fd
      fontconfig
      freetype
      fzf
      gdbm
      ghostscript
      glib
      gmp6
      gnumake
      go_1_17 # currently requires NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1
      golangci-lint
      google-cloud-sdk
      gopls
      graphviz
      grpcurl
      harfbuzzFull
      htop
      httrack
      jansson
      jq
      kitty
      kubectl
      less
      libcxx
      libgccjit
      libiconv
      libsndfile
      libssh2
      libxml2
      lima
      llvm
      msgpack
      multitail
      mutagen
      ncurses
      neovim
      netcat
      nim
      nimlsp
      nix-linter
      nix-prefetch-git
      nixfmt
      nmap
      nodejs
      oniguruma
      openapi-generator-cli
      openldap
      pandoc
      pcre
      pcre2
      pkgconfig
      podman
      protobuf3_11
      prototool
      qmk
      readline
      reattach-to-user-namespace
      ripgrep
      rust-analyzer
      rustup
      scons
      sd
      shared-mime-info
      shellcheck
      skhd
      skopeo
      sqlite
      ssm-session-manager-plugin
      starship
      taglib
      terraform-ls
      terraform
      tflint
      tmux
      tokei
      trivy
      unixtools.watch
      upx
      wget
      wireshark
      xsv
      yabai
      yaml-language-server
      yarn
      youtube-dl
      yq-go
      zenith
      # zig # broken as of 2022-02-07
      # zls # broken as of 2022-02-07
      zlib
      zoxide
      zsh
      # zsh-fzf-tab
      zstd
    ] ++ customPackages;

  nixpkgs.config.allowUnsupportedSystem = true;
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      # url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz
      # url = "https://github.com/mjlbach/emacs-overlay/archive/feature/flakes.tar.gz";
      # url = "https://github.com/nix-community/emacs-overlay/archive/2a3c3959436d97ff2db0cb765336f2747d875fb8.tar.gz";
      url =
        "https://github.com/nix-community/emacs-overlay/archive/17f60fe33f34c95d9d7341bc2bd65929dfdb44cb.tar.gz";
      # sha256 = "0qfvplmfpln5hh6k3jg0w08xnlmyd874awp5rpmkj3x3v6qnw6x9";
    }))
    (import ./neovim.nix)
  ];

  nix.useDaemon = true;
  # workaround for annoying warning bug: https://github.com/LnL7/nix-darwin/issues/145
  nix.nixPath = pkgs.lib.mkForce [{
    darwin-config = builtins.concatStringsSep ":" [
      "$HOME/.nixpkgs/darwin-configuration.nix"
      "$HOME/.nix-defexpr/channels"
    ];
  }];

  # Use a custom configuration.nix location.
  # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
  # environment.darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

  # Auto upgrade nix package and the daemon service.
  # nix.package = pkgs.nix;
  nix.package = pkgs.nixFlakes;
  # nix.package = pkgs.nixUnstable;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';
  services.yabai.enable = true;
  services.yabai.package = pkgs.yabai;
  services.skhd.enable = false;

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

    set -g default-terminal "xterm-24bit"
    set -ga terminal-overrides ",xterm-24bit:Tc"
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

  environment.variables = rec {
    AWS_SDK_LOAD_CONFIG = "1";
    LANG = "en_US.UTF-8";
    LANGUAGE = "en_US.UTF-8";
    LC_ALL = "en_US.UTF-8";
    LESS = "-F -i -M -R -X --incsearch";
    LESSCHARSET = "utf-8";
    FZF_DEFAULT_OPTS = "--info=inline --layout=default --tac --no-sort";
    FZF_DEFAULT_COMMAND = ''rg -g ""'';
    FZF_CTRL_R_OPTS = "--sort";
    HISTSIZE = "100000";
    SAVEHIST = "5000";
    BAT_PAGER = "less -F -i -M -R -X --incsearch";
    BAT_THEME = "1337";
  };

  programs.zsh.enable = true; # default shell on catalina
  programs.zsh.enableBashCompletion = true;
  programs.zsh.enableFzfCompletion = true;
  programs.zsh.enableFzfGit = true;
  programs.zsh.enableFzfHistory = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.enableSyntaxHighlighting = true;
  programs.zsh.promptInit = ''
    eval "$(zoxide init zsh)"
    eval "$(starship init zsh)"
  '';
  programs.zsh.shellInit = ''
    ${(builtins.readFile ../../zsh/.zshenv)}
  '';
  programs.zsh.interactiveShellInit = ''
    autoload -Uz compinit
    compinit
    bindkey -v
    # vi style incremental search
    bindkey '^R' history-incremental-search-backward
    bindkey '^P' history-search-backward
    bindkey '^N' history-search-forward
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"

    _tmux-select-window() {
      tmux list-windows -F '#W' | fzf | xargs -I% tmux select-window -t %
    }
    zle -N _tmux-select-window
    bindkey '^W' _tmux-select-window
    zstyle ':completion:*:*:*:*:*' menu select

    # kubernetes autocompletion
    source <(kubectl completion zsh)

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
    if command -v em.zsh >/dev/null; then
      export EDITOR=em.zsh
    elif command -v nvim; then
      export EDITOR=nvim
    else
      export EDITOR=vim
    fi
    export VISUAL=$EDITOR
    alias ssh='TERM=xterm-256color ssh'
    alias l='exa -alF'
    alias k='kubectl'
    alias ts='tmux new-session -n main -s'
    alias ta='tmux attach -t'
    alias tl='tmux list-sessions'
    alias kv='kubectl -n ves-system'
    alias doom='~/.emacs.d/bin/doom'
    alias nancy-report="go list -json -m all | nancy sleuth --output=json | jq -r '[.audited[]|select(.Vulnerabilities!=null)]' | yq eval -P -"
    source <(kubectl completion zsh)
    eval "$(direnv hook zsh)"
    export PATH=~/.local/bin:~/.cargo/bin:$PATH
    if [[ $(launchctl limit maxfiles | awk '{print $2}') -lt 1048576 ]]; then
        echo "maxfiles limit is too low, setting to 1048576..."
        sudo launchctl limit maxfiles 1048576 1048576
    fi
    printf '\e]2;local\a'
  '';

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
