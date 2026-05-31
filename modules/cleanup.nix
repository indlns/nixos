{ config, pkgs, ... }:

{
nix.settings.auto-optimise-store = true;

nix.gc = {
  automatic = true;
  dates = "weakly";
  options = "--delete-older-than 30d";
};
}
