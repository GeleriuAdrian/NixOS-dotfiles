{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;
    settings = {
      # Preload the image explicitly
      preload = [
        "/home/ady/Wallpapers/deer_landscape.jpg"
      ];

      # Use the explicit monitor/path object format
      wallpaper = [
        {
          monitor = "DP-1";
          path = "/home/ady/Wallpapers/deer_landscape.jpg";
        }
      ];
    };
  };
}
