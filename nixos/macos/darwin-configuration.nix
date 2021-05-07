{ config, pkgs, ... }:

{
  # workaround for https://github.com/NixOS/nixpkgs/issues/77503
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.0.2u"
  ];
  users.nix.configureBuildUsers = true;
  environment.systemPackages = with pkgs; [
    alacritty
    automake
    aws-iam-authenticator
    awscli2
    bash_5
    bat
    cachix
    cairo
    cloc
    cmake
    coreutils
    curlFull
    diff-so-fancy
    dos2unix
    # emacs # currently using a custom gccEmacs that appears to work ok
    emacsGit
    eternal-terminal
    exa
    fd
    fontconfig
    freetype
    fzf
    gdbm
    ghostscript
    # git # nix git doesn't support macos keychain
    glib
    gmp6
    gnumake
    golangci-lint
    graphviz
    grpcurl
    harfbuzzFull
    htop
    httrack
    jansson
    jq
    kubectl
    # libgccjit # currently broken, but emacs 28+gccjit is also broken anyway
    libressl
    libsndfile
    libssh2
    libxml2
    llvm_11
    msgpack
    ncurses
    neovim
    netcat
    nmap
    nodejs
    oniguruma
    openapi-generator-cli
    openldap
    pandoc
    pcre
    pcre2
    pinentry
    pkgconfig
    procs
    protobuf3_11
    python39Packages.cfn-lint
    readline
    reattach-to-user-namespace
    ripgrep
    rust-analyzer
    rustup
    sd
    shared-mime-info
    shellcheck
    skhd
    sqlite
    ssm-session-manager-plugin
    starship
    taglib
    terraform-ls
    tflint
    tmux
    unixtools.watch
    upx
    wget
    wireshark
    xsv
    yabai
    yq-go
    zenith
    zlib
    zoxide
    zsh
    zstd
  ];

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      # url = https://github.com/nix-community/emacs-overlay/archive/master.tar.gz;
      url = https://github.com/nix-community/emacs-overlay/archive/92f5ebe76f984c831f748339e07b683318add09a.tar.gz;
    }))
  ];

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
  # services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;
  services.yabai.enable = true;
  services.yabai.package = pkgs.yabai;
  services.skhd.enable = true;

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

  programs.zsh.enable = true;  # default shell on catalina
  programs.zsh.enableBashCompletion = true;
  programs.zsh.enableFzfCompletion = true;
  programs.zsh.enableFzfGit = true;
  programs.zsh.enableFzfHistory = true;
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
