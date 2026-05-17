{ config, pkgs, ... }:

{
    programs.alacritty = {
        enable = true;
        settings = {
            window.padding = { x = 12; y = 12; };
            font = {
                normal = { family = "monospace"; style = "Regular"; };
                size = 12.0;
            };
            colors = {
                primary = {
                    background = "#0a0a0f";
                    foreground = "#e0e0e0";
                };
                normal = {
                    black =   "#1a1a2e";
                    red =     "#ff5555";
                    green =   "#aaee66";
                    yellow =  "#f1fa8c";
                    blue =    "#6272a4";
                    magenta = "#f72585";
                    cyan =    "#8be9fd";
                    white =   "#e0e0e0";
                };
                bright = {
                    black =   "#44475a";
                    red =     "#ff6e6e";
                    green =   "#ccff88";
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
