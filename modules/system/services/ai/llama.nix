{ config, pkgs, ... }:

{
  systemd.services.llama-cpp = {
    serviceConfig = {
      WorkingDirectory = "/var/lib/llama-cpp";
      Restart = "always";
    };

  script = ''
    exec ${pkgs.llama-cpp-vulkan}/bin/llama-server \
      --api-key "$(cat ${config.sops.secrets.llama-api-key.path})" \
      --host 0.0.0.0 \
      --port 8040 \
      -m /var/lib/llama-cpp/models/Gemma-4-E2B-Uncensored-HauhauCS-Aggressive-Q2_K_P.gguf \
      -ngl -1 \
      -t 8 \
      --threads-batch 10 \
      -c 4096 \
      -fa auto
  '';

  wantedBy = [ "multi-user.target" ];
};
}
