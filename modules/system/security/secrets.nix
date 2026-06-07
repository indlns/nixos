{ config, pkgs, ... }:

{
  sops.secrets.cloudflare-token = {
    format = "yaml";
    sopsFile = ../../../secrets/common.yaml;
    key = "cloudflare.token";
  };

  sops.secrets.llama-token = {
    sopsFile = ./common.yaml;
    key = "api_tokens.llama";
  };
}