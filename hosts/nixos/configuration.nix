# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../../modules/system/default.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [
    "i915.enable_guc=3"
    # "nvidia-drm.modeset=1"
  ];

  # Enable Flake
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Enable CUPS to print documents.
  services.printing.enable = true;
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  wget
  home-manager
  nerdfetch
  lsd
  intel-media-driver
  intel-gpu-tools
  libva
  libva-utils
  vulkan-loader
  vulkan-tools
  cudatoolkit
  nvtop
  mesa
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

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  networking.firewall.allowedTCPPorts = [ 80 443  32400 9100 ];
  networking.firewall.allowedUDPPorts = [ 42873 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # List services that you want to enable:

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}