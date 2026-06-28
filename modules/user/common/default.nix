{ pkgs, ... }:

{
  imports = [
    ../cli/git.nix
    ../cli/lf.nix
  ];
}