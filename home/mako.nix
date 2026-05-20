{ config, pkgs, ... }:

{
    services.mako = {
        enable = true;
        settings = {
            background-color = "${config.theme.bgMako}";
            text-color = "${config.theme.fg}";
            border-color = "${config.theme.borderGray}";
            border-size = 2;
            border-radius = config.theme.rounding;
            padding = "12";
            margin = "8";
            font = "${config.theme.font} ${toString config.theme.makoFontSize}";
            default-timeout = 10000;
        };
    };
}
