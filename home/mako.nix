{ config, pkgs, ... }:

{
    services.mako = {
        enable = true;
        settings = {
            background-color = "${config.theme.bgSolid}";
            text-color = "${config.theme.fg}";
            border-color = "${config.theme.accent}";
            border-size = 2;
            border-radius = config.theme.rounding;
            padding = "12";
            margin = "8";
            font = "${config.theme.font} 11";
            default-timeout = 5000;
        };
    };
}
