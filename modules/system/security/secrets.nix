{ config, pkgs, ... }:

{
  sops.secrets.cloudflare-token = {
    format = "yaml";
    sopsFile = ../../../secrets/common.yaml;
    key = "cloudflare.token";
  };
}