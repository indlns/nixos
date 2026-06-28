# NFS

File: `modules/system/services/network/nfs.nix`
- Exposes `/srv/nfs` with export options.
- Uses `services.rpcbind.enable = true;` and `services.nfs.server.enable = true;`.
