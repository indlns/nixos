{ config, pkgs, ... }:

let
  ollama-cuda = pkgs.ollama.override { cudaSupport = true; };
in
{
    services.ollama = {
        enable = true;
        host = "0.0.0.0";
        port = 11434;
        package = ollama-cuda;
        environmentVariables = {
            OLLAMA_ORIGINS="*";
            OLLAMA_HOST="0.0.0.0:11434";
            OLLAMA_NUM_PARALLEL = "2";
            OLLAMA_NUM_THREADS = "10";
            OLLAMA_FLASH_ATTENTION = "1";
            OLLAMA_KEEP_ALIVE = "10m";
        };
    };
}