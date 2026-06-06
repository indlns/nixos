{ config, pkgs, ... }:

{
  users.users.indlns = {
      isNormalUser = true;
      description = "Evgenij";
      extraGroups = [ "networkmanager" "wheel" "docker" ];
      packages = with pkgs; [];
      shell = pkgs.zsh;
      openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIC06lalETXk8PZS1bG4eK1gxiOPjo6mh9rBHa4sq6x46 theindlns@gmail.com"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIIE8gEPkO8ldgeasbEh5DUJc55tp1LjwK18uGQRg2mW theindlns@gmail.com"  # сюда вставь твой публичный ключ
    ];
    };
}
