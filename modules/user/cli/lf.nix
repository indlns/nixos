{ pkgs, ... }:

{
    programs.lf = {
        enable = true;

        settings = {
            hidden = true;
            icons = true;
            drawbox = true;
            sixel = true;
        };

        extraConfig = ''
            set hidden
            set icons
            set drawbox
            set preview
        '';
    };
}