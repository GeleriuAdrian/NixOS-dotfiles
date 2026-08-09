{ pkgs, ... }:
let
  blender-hip =
    (pkgs.blender.override {
      rocmSupport = true;
      rocmPackages = pkgs.rocmPackages;
    }).overrideAttrs
      (old: {
        buildInputs = map (
          dep:
          if pkgs.lib.getName dep == "openshadinglanguage" then
            dep.override { llvmPackages = pkgs.llvmPackages_21; }
          else
            dep
        ) old.buildInputs;
      });
in
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
        ./gtk.nix
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
        xdg-desktop-portal-gtk
        soundwireserver

        # GUI apps
        loupe
        mpv
        librewolf
        thunderbird
        libresprite
        ardour
        pipewire
        nautilus

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
        gsettings-desktop-schemas

        # Gaming
        gamemode
        mangohud
        radeontop
        heroic

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
