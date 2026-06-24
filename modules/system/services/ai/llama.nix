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
      -m /var/lib/llama-cpp/models/qwen2.5-coder-14b-instruct.gguf \
      -ngl -1 \
      -t 16 \
      --threads-batch 16 \
      -c 65536 \
      --flash-attn auto \
      --cont-batching \
  '';

  wantedBy = [ "multi-user.target" ];
};
}
