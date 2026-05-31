{ config, pkgs, lib, ... }:

{
  fileSystems."/mnt/nas/backups" = {
    device = "192.168.10.176:/mnt/data/backups";
    fsType = "nfs";
    options = [
      "auto"
      "nofail"
      "noatime"
      "nolock"
      "intr"
      "tcp"
      "actimeo=1800"
  ];
  };

  fileSystems."/mnt/nas/documents" = {
    device = "192.168.10.176:/mnt/data/documents";
    fsType = "nfs";
    options = [
      "auto"
      "nofail"
      "noatime"
      "nolock"
      "intr"
      "tcp"
      "actimeo=1800"
  ];
  };
  
  fileSystems."/mnt/nas/photo" = {
    device = "192.168.10.176:/mnt/data/photo";
    fsType = "nfs";
    options = [
      "auto"
      "nofail"
      "noatime"
      "nolock"
      "intr"
      "tcp"
      "actimeo=1800"
  ];
  };

  fileSystems."/mnt/nas/nextcloud" = {
    device = "192.168.10.176:/mnt/data/nextcloud";
    fsType = "nfs";
    options = [
      "auto"
      "nofail"
      "noatime"
      "nolock"
      "intr"
      "tcp"
      "actimeo=1800"
  ];
  };

  fileSystems."/mnt/nas/media" = {
    device = "192.168.10.176:/mnt/media/media";
    fsType = "nfs";
    options = [
      "auto"
      "nofail"
      "noatime"
      "nolock"
      "intr"
      "tcp"
      "actimeo=1800"
  ];
  };
}
