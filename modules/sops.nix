{ config, pkgs, inputs, ... }:

{
  sops.defaultSopsFile = "${inputs.self}/secrets/common.yaml";
  sops.age.keyFile = "/home/indlns/.config/sops/age/keys.txt";
  sops.defaultSopsFormat = "yaml";
  sops.age.generateKey = false;
}