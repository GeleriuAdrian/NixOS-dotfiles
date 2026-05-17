{ config, pkgs, ... }:

{
    programs.alacritty = {
        enable = true;
        settings = {
            window.padding = { x = 12; y = 12; };
            font = {
                normal = { family = config.theme.font; style = "Regular"; };
                size = config.theme.termFontSize;
            };
            colors = {
                primary = {
                    background = config.theme.bg;
                    foreground = config.theme.fg;
                };
                normal = {
                    black =   "#1a1a2e";
                    red =     "#ff5555";
                    green =   config.theme.accent;
                    yellow =  "#f1fa8c";
                    blue =    "#6272a4";
                    magenta = "#f72585";
                    cyan =    "#8be9fd";
                    white =   config.theme.fg;
                };
                bright = {
                    black =   "#44475a";
                    red =     "#ff6e6e";
                    green =   config.theme.accentSoft;
                    yellow =  "#ffffa5";
                    blue =    "#92a2d4";
                    magenta = "#ff92df";
                    cyan =    "#a4ffff";
                    white =   "#ffffff";
                };
            };
            terminal.shell = {
                program = "/run/current-system/sw/bin/fish";
                args = [ "-c" "fish" ];
            };
        };
    };
}
