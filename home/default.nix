{ ... }:

{
  home-manager.backupFileExtension = "backup";
  home-manager.useUserPackages = false;
  home-manager.useGlobalPkgs = true;

  home-manager.users.ady =
    { ... }:
    {
      home.stateVersion = "25.11";
      home.username = "ady";
      home.homeDirectory = "/home/ady";
      imports = [
        ./alacritty.nix
        ./fish.nix
        ./hyprland.nix
        ./hyprpaper.nix
        ./mako.nix
        ./micro.nix
        ./qutebrowser.nix
        ./swayosd.nix
        ./theme.nix
        ./waybar.nix
        ./wlsunset.nix
        ./wofi.nix
        ./yazi.nix
        ./zed.nix
      ];
      xdg.desktopEntries = {
        ddnet = {
          name = "DDRaceNetwork";
          exec = "steam steam://run/412220";
          icon = "steam_icon_412220";
          comment = "Launch DDRaceNetwork from Steam";
          categories = [ "Game" ];
          terminal = false;
        };
      };
    };
}
