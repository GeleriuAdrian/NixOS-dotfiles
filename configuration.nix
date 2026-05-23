{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
  ];

  home-manager.users.ady =
    { ... }:
    {
      home.stateVersion = "25.11";
      home.username = "ady";
      home.homeDirectory = "/home/ady";
      imports = [
        ./home/alacritty.nix
        ./home/fish.nix
        ./home/mako.nix
        ./home/wofi.nix
        ./home/waybar.nix
        ./home/hyprland.nix
        ./home/hyprpaper.nix
        ./home/theme.nix
        ./home/swayosd.nix
        ./home/qutebrowser.nix
        ./home/micro.nix
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
  home-manager.backupFileExtension = "backup";

  # ============================================================
  # BOOT
  # ============================================================
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
    initrd.kernelModules = [ "amdgpu" ];
    initrd.verbose = false;
    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "rd.udev.log_priority=3"
    ];
    loader.timeout = 0;
  };

  # ============================================================
  # SYSTEMD OPTIMIZATIONS
  # ============================================================
  home-manager.useUserPackages = false;
  home-manager.useGlobalPkgs = true;

  systemd.services.NetworkManager.serviceConfig.TimeoutStartSec = "2s";
  systemd.services.NetworkManager-dispatcher.enable = false;
  systemd.services.wpa_supplicant.enable = false;

  # ============================================================
  # NETWORKING
  # ============================================================
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    networkmanager.dns = "systemd-resolved";
    # wireless.enable = false;
  };
  services.resolved.enable = true;

  # ============================================================
  # DESKTOP PORTALS (Fixed for Zed Files & Links)
  # ============================================================
  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };

  xdg.portal = {
    enable = true;
    # Ensure the GTK portal is present to handle the FileChooser
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];

    # Newer NixOS versions prefer this mapping style for the portal configuration
    config = {
      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
      };
    };
  };

  services.upower.enable = true;

  # ============================================================
  # LOCALE & TIME
  # ============================================================
  time.timeZone = "Europe/Bucharest";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT = "ro_RO.UTF-8";
    LC_MONETARY = "ro_RO.UTF-8";
    LC_NAME = "ro_RO.UTF-8";
    LC_NUMERIC = "ro_RO.UTF-8";
    LC_PAPER = "ro_RO.UTF-8";
    LC_TELEPHONE = "ro_RO.UTF-8";
    LC_TIME = "ro_RO.UTF-8";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # ============================================================
  # SECURITY
  # ============================================================
  security = {
    rtkit.enable = true;
    polkit.enable = true;
    sudo.extraRules = [
      {
        users = [ "ady" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
  };
  security.pam.services.greetd.enableGnomeKeyring = true;
  services.gnome.gnome-keyring.enable = true;

  # ============================================================
  # HARDWARE
  # ============================================================
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # ============================================================
  # AUDIO
  # ============================================================
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  musnix.enable = true;

  # ============================================================
  # DESKTOP
  # ============================================================
  programs.hyprland.enable = true;
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "start-hyprland";
        user = "ady";
      };
    };
  };

  # ============================================================
  # STORAGE
  # ============================================================
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/1d19bf89-8827-4fa1-876d-cd00844abe8a";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
    ];
  };
  services.udisks2.enable = true;

  # ============================================================
  # USER
  # ============================================================
  programs.fish.enable = true;
  hardware.i2c.enable = true;
  boot.kernelModules = [ "i2c-dev" ];
  users.users.ady = {
    isNormalUser = true;
    description = "Adrian Geleriu";
    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "audio"
      "disk"
      "realtime"
      "i2c"
      "input"
    ];
    shell = pkgs.fish;
  };
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # ============================================================
  # PROGRAMS
  # ============================================================
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  # ============================================================
  # THEME
  # ============================================================
  environment.variables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    ICON_THEME = "Papirus-Dark";
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  # ============================================================
  # PACKAGES
  # ============================================================
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    wget
    git
    nano
    micro
    lm_sensors
    appimage-run
    xdg-utils
    glib
    rofi-calc
    gcc
    clang
    cmake
    clang-tools
    nil
    nixd

    grimblast
    libnotify
    ddcutil
    swayosd
    playerctl

    thunar
    loupe
    mpv
    nautilus

    networkmanagerapplet

    polkit_gnome
    gnome-keyring
    libsecret

    hyprpaper
    qt6Packages.qt6ct
    kdePackages.breeze
    nwg-look
    bibata-cursors
    kdePackages.qtstyleplugin-kvantum
    papirus-icon-theme
    arc-theme

    librewolf
    thunderbird

    pipewire
    ardour

    blender
    libresprite
    zed-editor

    gamemode
    mangohud
    radeontop
  ];

  system.stateVersion = "25.11";
}
