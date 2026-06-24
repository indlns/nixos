{ config, pkgs, ... }:

{
  systemd.services.llama-cpp = {
    serviceConfig = {
      WorkingDirectory = "/var/lib/llama-cpp";
      Restart = "always";
    };

  script = ''
    exec ${pkgs.llama-cpp.override { cudaSupport = true; }}/bin/llama-server \
      --api-key "$(cat ${config.sops.secrets.llama-api-key.path})" \
      --host 0.0.0.0 \
      --port 8040 \
      -m /var/lib/llama-cpp/models/Gemma-4-E2B-Uncensored-HauhauCS-Aggressive-Q2_K_P.gguf \
      -ngl -1 \
      -t 16 \
      --threads-batch 16 \
      -c 16384 \
      --flash-attn \
      --cont-batching \
  '';

  wantedBy = [ "multi-user.target" ];
};
}
