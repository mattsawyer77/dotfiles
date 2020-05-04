{ lib, pkgs, ... }:

let
  inherit (pkgs) runCommand ncurses;

  # Terminfo file for 24-bit color
  terminfo-xterm-24bit = runCommand "terminfo-xterm-24bit" {} ''
    cat >terminfo-xterm-24bit.src <<EOF
    xterm-24bit|xterm with 24-bit direct color mode,
      use=xterm-256color,
      setb24=\E[48;2;%p1%{65536}%/%d;%p1%{256}%/%{255}%&%d;%p1%{255}%&%dm,
      setf24=\E[38;2;%p1%{65536}%/%d;%p1%{256}%/%{255}%&%d;%p1%{255}%&%dm,
    EOF
    mkdir -p "$out/share/terminfo"
    ${lib.getBin ncurses}/bin/tic -x -o "$out/share/terminfo" terminfo-xterm-24bit.src
  '';
in {
  environment.systemPackages = with pkgs; [
    aws-iam-authenticator
    awscli
    bat
    cargo
    cargo-tree
    emacs
    eternal-terminal
    exa
    fd
    fzf
    fzf-zsh
    gcc
    git
    go
    jq
    libcap
    neovim
    nix-zsh-completions
    nodejs
    openssl
    pkg-config
    ripgrep
    rustup
    starship
    terminfo-xterm-24bit
    terraform
    tflint
    tflint
    tmux
    wget
    zlib
    zsh
    zsh-autosuggestions
    zsh-syntax-highlighting
  ];
}
