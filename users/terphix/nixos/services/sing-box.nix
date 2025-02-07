{
  pkgs,
  config,
  ...
}:
let
  server = config.sops.secrets."terphix/vpn/server".path;
  uuid = config.sops.secrets."terphix/vpn/uuid".path;
  public_key = config.sops.secrets."terphix/vpn/public_key".path;
  short_id = config.sops.secrets."terphix/vpn/short_id".path;
  tls_server_name = config.sops.secrets."terphix/vpn/tls_server_name".path;
  tls_fingerprint = config.sops.secrets."terphix/vpn/tls_fingerprint".path;
  dns_address = config.sops.secrets."terphix/vpn/dns_address".path;
  type = config.sops.secrets."terphix/vpn/type".path;
in
{
  sops.secrets = {
    "terphix/vpn/server" = { };
    "terphix/vpn/uuid" = { };
    "terphix/vpn/public_key" = { };
    "terphix/vpn/short_id" = { };
    "terphix/vpn/tls_server_name" = { };
    "terphix/vpn/tls_fingerprint" = { };
    "terphix/vpn/dns_address" = { };
    "terphix/vpn/type" = { };
  };

  services.sing-box = {
    enable = true;
    package = pkgs.sing-box;
    settings = {
      dns = {
        independent_cache = true;
        rules = [
          {
            query_type = [
              32
              33
            ];
            server = "dns-block";
          }
          {
            domain_suffix = ".lan";
            server = "dns-block";
          }
        ];
        servers = [
          {
            address._secret = dns_address;
            address_resolver = "dns-local";
            detour = "proxy";
            strategy = "";
            tag = "dns-remote";
          }
          {
            address = "local";
            address_resolver = "dns-local";
            detour = "direct";
            strategy = "";
            tag = "dns-direct";
          }
          {
            address = "rcode://success";
            tag = "dns-block";
          }
          {
            address = "local";
            detour = "direct";
            tag = "dns-local";
          }
        ];
      };
      inbounds = [
        {
          domain_strategy = "";
          listen = "127.0.0.1";
          listen_port = 2080;
          sniff = true;
          sniff_override_destination = false;
          tag = "mixed-in";
          type = "mixed";
        }
      ];
      log = {
        level = "info";
      };
      outbounds = [
        {
          domain_strategy = "";
          flow = "";
          packet_encoding = "";
          server._secret = server;
          server_port = 443;
          tag = "proxy";
          tls = {
            enabled = true;
            reality = {
              enabled = true;
              public_key._secret = public_key;
              short_id._secret = short_id;
            };
            server_name._secret = tls_server_name;
            utls = {
              enabled = true;
              fingerprint._secret = tls_fingerprint;
            };
          };
          type._secret = type;
          uuid._secret = uuid;
        }
      ];
    };
  };

  networking.proxy = {
    httpsProxy = "http://127.0.0.1:2080";
    httpProxy = "http://127.0.0.1:2080";
  };
}
