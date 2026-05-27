{ pkgs, ... }:

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

      # ============================================================
      # THEME / ENVIRONMENT
      # ============================================================
      home.sessionVariables = {
        QT_QPA_PLATFORMTHEME = "qt6ct";
        XCURSOR_THEME = "Bibata-Modern-Classic";
        XCURSOR_SIZE = "24";
        ICON_THEME = "Papirus-Dark";
      };

      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
        };
      };

      # ============================================================
      # PACKAGES
      # ============================================================
      home.packages = with pkgs; [
        # CLI utilities
        wget
        git
        micro
        lm_sensors
        appimage-run
        xdg-utils
        glib
        yazi

        # Development
        cmake
        clang-tools
        nixd
        nil

        # Wayland / desktop
        grimblast
        libnotify
        ddcutil
        swayosd
        playerctl
        hyprpaper
        wlsunset

        # GUI apps
        loupe
        mpv
        librewolf
        thunderbird
        blender
        libresprite
        ardour
        pipewire

        # System tray / auth
        networkmanagerapplet
        polkit_gnome
        gnome-keyring
        libsecret

        # Theme
        qt6Packages.qt6ct
        kdePackages.breeze
        nwg-look
        bibata-cursors
        kdePackages.qtstyleplugin-kvantum
        papirus-icon-theme
        arc-theme

        # Gaming
        gamemode
        mangohud
        radeontop

        # Launcher extras
        rofi-calc
      ];

      # ============================================================
      # DESKTOP ENTRIES
      # ============================================================
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
