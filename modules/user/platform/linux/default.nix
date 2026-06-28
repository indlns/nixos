{ pkgs, ... }:

{
  imports = [
    ../../common/default.nix
    ../../cli/opencode.nix
    ../../shell/bash.nix
    ../../shell/zsh.nix
  ];
}