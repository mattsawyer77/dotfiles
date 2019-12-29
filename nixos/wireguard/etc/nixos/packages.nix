{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    bind
    git
    tmux
    unbound
    vim
    wireguard
  ];
}
