{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    <musnix>
    <home-manager/nixos>
    ];

  home-manager.users.ady = { pkgs, ... }: {
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
  };
  home-manager.backupFileExtension = "backup";

  # ============================================================
  # LOCAL AI WORKLOADS (Ollama + Open WebUI)
  # ============================================================
  services.ollama = {
      enable = true;
      # Uses the dedicated rocm accelerated package for AMD GPUs
      package = pkgs.ollama-rocm; 
    };
  
    services.open-webui = {
      enable = true;
      port = 1111; # Sets the port it will run on locally
      environment = {
        ANONYMIZED_TELEMETRY = "False";
        DO_NOT_TRACK = "True";
        WEBUI_AUTH = "False"; # Disables the local account login loop so it boots instantly
      };
    };

  # ============================================================
  # BOOT
  # ============================================================
  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  # ============================================================
  # NETWORKING
  # ============================================================
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    networkmanager.dns = "systemd-resolved";
    wireless.enable = false;
  };
  services.resolved.enable = true;
  systemd.services.wpa_supplicant.enable = false;

  xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-hyprland ];
  };
  services.upower.enable = true;

  # ============================================================
  # LOCALE & TIME
  # ============================================================
  time.timeZone = "Europe/Bucharest";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS      = "ro_RO.UTF-8";
    LC_IDENTIFICATION = "ro_RO.UTF-8";
    LC_MEASUREMENT  = "ro_RO.UTF-8";
    LC_MONETARY     = "ro_RO.UTF-8";
    LC_NAME         = "ro_RO.UTF-8";
    LC_NUMERIC      = "ro_RO.UTF-8";
    LC_PAPER        = "ro_RO.UTF-8";
    LC_TELEPHONE    = "ro_RO.UTF-8";
    LC_TIME         = "ro_RO.UTF-8";
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
    settings.default_session = {
      command = "Hyprland";
      user = "ady";
    };
  };

  # ============================================================
  # STORAGE
  # ============================================================
  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/1d19bf89-8827-4fa1-876d-cd00844abe8a";
    fsType = "ext4";
    options = [ "defaults" "noatime"];
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
  nix.settings.experimental-features = [ "nix-command" "flakes"];

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
    # System tools
    wget
    git
    nano
    micro
    lm_sensors
	appimage-run
	xdg-utils
	glib
	rofi-calc

    # Hyprland ecosystem
    grimblast
    libnotify
	ddcutil
	swayosd
	playerctl

    # File management
    xfce.thunar
    loupe
    mpv

    # Network
    networkmanagerapplet

    # Authentication
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

    # Browser & mail
    librewolf
    thunderbird

    # Audio
    pipewire
    ardour

    # Creative
    blender
    libresprite
    zed-editor

    # Gaming
    gamemode
    mangohud
    radeontop
  ];

  # ============================================================
  # SYSTEM
  # ============================================================
  system.stateVersion = "25.11";
}
