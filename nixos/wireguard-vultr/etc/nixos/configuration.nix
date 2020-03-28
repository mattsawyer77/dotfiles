{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./networking.nix # generated at runtime by nixos-infect
    ./packages.nix
  ];

  boot.cleanTmpDir = true;
  networking.hostName = "msawyer77-wireguard";
  # enable NAT
  networking.nat.enable = true;
  networking.nat.externalInterface = "ens3";
  networking.nat.internalInterfaces = [ "wg0" ];
  networking.firewall = {
    enable = true;
    allowPing = true;
    allowedUDPPorts = [ 51820 53 ];
    allowedTCPPorts = [ 22 53 2022 ];

    # This allows the wireguard server to route your traffic to the internet and hence be like a VPN
    # For this to work you have to set the dnsserver IP of your router (or dnsserver of choice) in your clients
    extraCommands = ''
      iptables -A FORWARD -i %i -j ACCEPT
      iptables -t nat -A POSTROUTING -s 10.100.0.0/24 -o ens3 -j MASQUERADE
    '';
  };

  networking.wireguard.interfaces = {
    # "wg0" is the network interface name. You can name the interface arbitrarily.
    wg0 = {
      # Determines the IP address and subnet of the server's end of the tunnel interface.
      ips = [ "10.100.0.1/24" ];

      # The port that Wireguard listens to. Must be accessible by the client.
      listenPort = 51820;

      # Path to the private key file.
      #
      # Note: The private key can also be included inline via the privateKey option,
      # but this makes the private key world-readable; thus, using privateKeyFile is
      # recommended.
      privateKeyFile = "/etc/wireguard/keys/private";

      peers = [
        # NOTE: preserving 10.100.0.1 for DNS server
        # List of allowed peers.
        #{
        #  publicKey = "0t2DXJKvmteKM75GmWcsmxfnOP8+SVX7EeVYrf4xNl0=";
        #  # List of IPs assigned to this peer within the tunnel subnet. Used to configure routing.
        #  allowedIPs = [ "10.100.0.2/32" ];
        #}
        { # Matt's macbook key
          publicKey = "o1MJ8EiDZIwbvdk3VCfF9hHWy+tqoFjeITwTqESN0wc=";
          allowedIPs = [ "10.100.0.3/32" ];
        }
        { # mPhoneXS key
          publicKey = "3AV9TvRupZgv9cMfrfMyghgi1fZj49qzauV/6eUdJXE=";
          allowedIPs = [ "10.100.0.4/32" ];
        }
        { # Justin's phone's key
          publicKey = "jPbI7Pr7vPPYxjs54bsgjaQjkh2Opo7xcGeiSCPiXV8=";
          allowedIPs = [ "10.100.0.10/32" ];
        }
        { # Amy's phone's key
          publicKey = "l2hjORnIc5l/4XITz9U61bvfHe/lrLslwtSFpBaYLSo=";
          allowedIPs = [ "10.100.0.20/32" ];
        }
        { # Justin's iPad's key
          publicKey = "YEocQBPgaHZE/lDo8HzRgqTlisl4GCIwEfoutxT3d0k=";
          allowedIPs = [ "10.100.0.11/32" ];
        }
      ];
    };
  };
  services.unbound.enable = true;
  services.unbound.allowedAccess = [ "10.100.0.0/24" "127.0.0.1" ];
  services.unbound.interfaces = [ "0.0.0.0" ];
  services.unbound.forwardAddresses = [
    "1.0.0.1"         # 1.0.0.1
    "205.171.3.65"    # Qwest US
    "208.67.222.222"  # OpenDNS-2
    # "205.171.2.65"             # Qwest-2 US
    # "129.250.35.251"           # NTT-2
    # "2001:470:20::2"         # Hurricane Electric
    # "208.67.220.220"         # OpenDNS
    # "108.61.10.10"           # Vultr (retrieved from dhcpcd)
    # "8.8.4.4"                # Google Public DNS-2
    # "208.67.222.220"         # OpenDNS-3
    # "2001:418:3ff::1:53"     # NTT-2 IPv6
  ];
  services.unbound.extraConfig = ''
    verbosity: 3
    log-queries: yes
    log-replies: yes
    log-local-actions: yes
    include: /var/lib/unbound/ads.conf
  '';

  services.openssh.enable = true;
  services.openssh.permitRootLogin = "no";
  services.eternal-terminal.enable = true;
  users.users.matt = {
    isNormalUser = true;
    home = "/home/matt";
    description = "Matt Sawyer";
    extraGroups = [ "wheel" "networkmanager" ];
  };
  users.users.matt.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIA6mpx20lo0Utp+OfxPEG88co6tLBQ7LMphTIcAsNqK4 sawyer@SEA-ML-00059144"
  ];
  system.autoUpgrade.enable = true;
}