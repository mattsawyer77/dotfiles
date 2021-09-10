{ pkgs, ... }:

with pkgs;

{
  systemd.timers.adblock-update = {
    wantedBy = [ "timers.target" ];
    partOf = [ "adblock-update.service" ];
    timerConfig.OnCalendar = "daily";
  };

  systemd.services.adblock-update = {
    serviceConfig.Type = "oneshot";
    script = ''
      echo "$(date)>updating adblock config..." >> /tmp/adblock-update.log;
      if [[ -x ~/.local/bin/dns_blocklist_updater ]]; then
        echo "$(date)>retrieving latest blocklist..." >> /tmp/adblock-update.log \
          && ~/.local/bin/dns_blocklist_updater >ads.conf \
          && echo "$(date)>blocklist retrieved..." >> /tmp/adblock-update.log \
          && cp ads.conf /var/lib/unbound/ads.conf \
          && echo "$(date)>restarting unbound..." >> /tmp/adblock-update.log \
          && systemctl restart unbound;
      else
        echo "$(date)>~/.local/bin/dns_blocklist_updater not found or not executable!" >> /tmp/adblock-update.log
      fi
    '';
  };
}
