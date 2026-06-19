{ pkgs, ... }:

{
  imports = [
    ../../modules/user/default.nix
  ];

  home.username = "indlns";
  home.homeDirectory = "/Users/indlns";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.sessionVariables = {
    POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD = "true";
  };

  home.packages = with pkgs; [
    git
    htop
    fastfetch
    nerd-fonts.fira-code
  ];
}
