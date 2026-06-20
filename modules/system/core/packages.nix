{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wget
    home-manager
    nerdfetch
    lsd 
    age 
    sops
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-color-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    fira-code-symbols
  ];
}
