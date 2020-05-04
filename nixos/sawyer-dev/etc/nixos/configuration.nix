# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./packages.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "sawyer-dev"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlp1s0.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";

  environment.variables = rec {
    AWS_SDK_LOAD_CONFIG="1";
    LANG="en_US.UTF-8";
    LANGUAGE="en_US.UTF-8";
    LC_ALL="en_US.UTF-8";
    LESS="-F -g -i -M -R -X";
    LESSCHARSET="utf-8";
    TERM="xterm-24bit";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.eternal-terminal.enable = true;

  # Open ports in the firewall.
  networking.firewall.enable = true;
  networking.firewall.allowPing = true;
  networking.firewall.allowedTCPPorts = [ 22 2022 ];
  # networking.firewall.allowedUDPPorts = [ ... ];

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    promptInit = ''
      eval "$(starship init zsh)"
    '';
    shellAliases = {
      ssh = "TERM=xterm-256color ssh";
      l ="exa -alF";
    };
    histSize = 500000;
    setOptions = [
      "SHARE_HISTORY"
      "HIST_IGNORE_ALL_DUPS"
      "HIST_IGNORE_DUPS"
      "INC_APPEND_HISTORY"
    ];
    interactiveShellInit = ''
      bindkey -v
      # vi style incremental search
      bindkey '^R' history-incremental-search-backward
      bindkey '^S' history-incremental-search-forward
      bindkey '^P' history-search-backward
      bindkey '^N' history-search-forward
      zstyle ':completion:*:*:*:*:*' menu select
      source "$(fzf-share)/key-bindings.zsh"
      source "$(fzf-share)/completion.zsh"
    '';
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sawyer = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  };
  users.users.sawyer.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH9y8o2poix1HHVcOX7eWS9PLcrZ/XZD4h4Mi3IOwumZ sawyer@SEA-ML-SAWYER"
  ];
  system.autoUpgrade.enable = true;
  system.autoUpgrade.channel = https://nixos.org/channels/nixos-unstable;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  # system.stateVersion = "20.03"; # Did you read the comment?
}
