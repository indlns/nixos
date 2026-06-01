{ config, pkgs, ... }:

{
systemd.services.llama-cpp = {
  serviceConfig = {
    WorkingDirectory = "/var/lib/llama-cpp";
    Restart = "always";
  };

  script = ''
    exec ${pkgs.llama-cpp-vulkan}/bin/llama-server \
      --host 0.0.0.0 \
      --port 8040 \
      -m /var/lib/llama-cpp/models/gemma-4-E2B-it-Q4_K_M.gguf \
      --ctx-size 4096
  '';

  wantedBy = [ "multi-user.target" ];
};
}
