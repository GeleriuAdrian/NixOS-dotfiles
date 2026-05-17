{ config, pkgs, ... }:

{
    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [ "/home/ady/Wallpapers/deer_landscape.jpg" ];
            wallpaper = [ "DP-1,/home/ady/Wallpapers/deer_landscape.jpg" ];
        };
    };
}
