{ config, pkgs, ... }:

{
  sops.secrets.llama-api-key = {
    sopsFile = ../../../secrets/common.yaml;
    key = "api_tokens.llama";
  };
}