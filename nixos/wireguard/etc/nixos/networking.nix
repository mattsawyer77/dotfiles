{ lib, ... }: {
  # This file was populated at runtime with the networking
  # details gathered from the active system.
  networking = {
    nameservers = [
      "8.8.4.4"         # Google Public DNS-2
      "156.154.70.22"   # Comodo Secure DNS
      "74.82.42.42"     # Hurricane Electric
    ];
    defaultGateway = "167.172.192.1";
    #defaultGateway6 = "";
    dhcpcd.enable = true;
    usePredictableInterfaceNames = lib.mkForce true;
    interfaces = {
      eth0 = {
        ipv4.addresses = [
          #{ address="167.172.202.207"; prefixLength=20; }
          { address="10.46.0.5"; prefixLength=16; }
        ];
        #ipv6.addresses = [
          #{ address="fe80::60b1:9eff:feea:bac9"; prefixLength=64; }
        #];
        ipv4.routes = [ { address = "167.172.192.1"; prefixLength = 32; } ];
        #ipv6.routes = [ { address = ""; prefixLength = 32; } ];
      };
      
    };
  };
  services.udev.extraRules = ''
    ATTR{address}=="62:b1:9e:ea:ba:c9", NAME="eth0"
    
  '';
}
