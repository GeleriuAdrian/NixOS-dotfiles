{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./home/default.nix
    ./home/rgb.nix
    ./home/actual.nix
  ];

  # ============================================================
  # NIX
  # ============================================================
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;
  programs.nix-ld.enable = true;

  # ============================================================
  # BOOT
  # ============================================================
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [ "i2c-dev" ];
    initrd = {
      kernelModules = [ "amdgpu" ];
      verbose = false;
    };
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
  };

  # ============================================================
  # RGB
  # ============================================================
  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd"; # important for your Ryzen/B550 board
  };

  # ============================================================
  # NETWORKING
  # ============================================================
  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      dns = "systemd-resolved";
    };
  };
  services.resolved.enable = true;

  systemd.services = {
    NetworkManager.serviceConfig.TimeoutStartSec = "2s";
    NetworkManager-dispatcher.enable = false;
    wpa_supplicant.enable = false;
  };

  # ============================================================
  # LOCALE & TIME
  # ============================================================
  time.timeZone = "Europe/Bucharest";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
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
  };
  services.xserver.xkb.layout = "us";

  # ============================================================
  # HARDWARE
  # ============================================================
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    i2c.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.Policy.AutoEnable = "true";
    };
  };
  services.blueman.enable = true;

  # ============================================================
  # AUDIO
  # ============================================================
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
  musnix.enable = true;
  security.rtkit.enable = true;

  # ============================================================
  # DESKTOP
  # ============================================================
  programs.hyprland.enable = true;

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "start-hyprland";
      user = "ady";
    };
  };

  environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal-gtk
    ];
    config.common = {
      default = [ "gtk" ];
      "org.freedesktop.impl.portal.ScreenCast" = [ "hyprland" ];
      "org.freedesktop.impl.portal.Screenshot" = [ "hyprland" ];
      "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
    };
    systemd.user.services.xdg-desktop-portal-gtk = {
      environment = {
        GDK_BACKEND = "wayland";
        DISPLAY = "";
      };
  };

  services.upower.enable = true;

  # ============================================================
  # SECURITY
  # ============================================================
  security = {
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
    pam.services.greetd.enableGnomeKeyring = true;
  };
  services.gnome.gnome-keyring.enable = true;

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

  # ============================================================
  # GAMING
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
  environment.systemPackages = with pkgs; [
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
    gcc
    clang
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

  system.stateVersion = "25.11";
}
