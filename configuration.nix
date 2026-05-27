{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./boot.nix
    ./nixos/hardware.nix
    ./nixos/networking.nix
    ./nixos/audio.nix
    ./nixos/desktop.nix
    ./nixos/security.nix
    ./home/default.nix
    ./home/rgb.nix
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
  # FONTS
  # ============================================================
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    jetbrains-mono
    nerd-fonts.jetbrains-mono
  ];

  # ============================================================
  # GAMING
  # ============================================================
  programs.steam.enable = true;
  programs.gamemode.enable = true;

  system.stateVersion = "25.11";
}
