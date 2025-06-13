# dnscrypt-proxy.nix
{ config, lib, pkgs, ... }:
{
  options = {
    dnscrypt-proxy.enable = lib.mkEnableOption "Enable DNSCrypt with dnscrypt-proxy2";
  };

  config = lib.mkIf config.dnscrypt-proxy.enable {
    services.dnscrypt-proxy2 = {
      enable = true;
      settings = {
          ipv4_servers = true;
          require_dnssec = true;

        sources.public-resolvers = {
          urls = [
            "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
            "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
          ];
          cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
          minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
        };      # Add sources.relays
      };
    };
  
    systemd.services.dnscrypt-proxy2.serviceConfig = {
      StateDirectory = "dnscrypt-proxy";
    };
  };
}
