{ config, pkgs, inputs, ... }:

{
  sops.secrets.cloudflare-token = {
  format = "yaml";
  sopsFile = "${inputs.self}/secrets/common.yaml";
  key = "cloudflare.token";
};
}