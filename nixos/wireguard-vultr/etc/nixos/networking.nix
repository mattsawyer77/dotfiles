{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [
    "1.0.0.1"                # Cloudflare
    "1.1.1.1"                # Cloudflare
    "208.67.222.222"         # OpenDNS-2
    "2001:470:20::2"         # Hurricane Electric
    "205.171.3.65"           # Qwest US
    "129.250.35.251"         # NTT-2
    "2001:418:3ff::1:53"     # NTT-2 IPv6
    # "205.171.2.65"             # Qwest-2 US
    # "129.250.35.251"           # NTT-2
    # "2001:470:20::2"         # Hurricane Electric
    # "208.67.220.220"         # OpenDNS
    # "108.61.10.10"           # Vultr (retrieved from dhcpcd)
    # "8.8.4.4"                # Google Public DNS-2
    # "208.67.222.220"         # OpenDNS-3
    # "2001:418:3ff::1:53"     # NTT-2 IPv6
    ];
    defaultGateway = "45.32.224.1";
    #defaultGateway6 = "";
    dhcpcd.enable = true;
    usePredictableInterfaceNames = lib.mkForce true;
    interfaces = {
      ens3 = {
        ipv4.addresses = [
          { address="45.32.224.145"; prefixLength=22; }
        ];
        #ipv6.addresses = [
        #  { address="2001:19f0:8001:1a85:5400:02ff:fe7e:f4e1"; prefixLength=64; }
        #];
        #ipv4.routes = [ { address = "45.32.224.1"; prefixLength = 22; } ];
        #ipv6.routes = [ { address = "2001:19f0:8001:1a85::"; prefixLength = 32; } ];
      };
      
    };
  };
  #services.udev.extraRules = ''
    #ATTR{address}=="62:b1:9e:ea:ba:c9", NAME="ens3"
    #
  #'';
}
