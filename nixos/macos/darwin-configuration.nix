{ config, pkgs, ... }:

{
  # workaround for https://github.com/NixOS/nixpkgs/issues/77503
  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.0.2u"
  ];
  environment.systemPackages = with pkgs; [
    alacritty
    automake
    aws-iam-authenticator
    awscli2
    bash_5
    bat
    cairo
    cloc
    cmake
    coreutils
    curlFull
    diff-so-fancy
    dos2unix
    emacs
    eternal-terminal
    exa
    fd
    fontconfig
    freetype
    fzf
    gdbm
    ghostscript
    git
    glib
    gmp6
    gnumake
    golangci-lint
    graphviz
    grpcurl
    harfbuzzFull
    htop
    jansson
    jq
    kubectl
    libgccjit
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
    terraform-lsp
    tflint
    tmux
    unixtools.watch
    upx
    wget
    wireshark
    xsv
    yabai
    yq
    zenith
    zlib
    zoxide
    zsh
    zstd
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

  # Create /etc/bashrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina
  # programs.fish.enable = true;

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
}
