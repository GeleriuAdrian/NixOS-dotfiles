{ pkgs, ... }:

{
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
  };

  services.upower.enable = true;

  services.hardware.openrgb = {
    enable = true;
    package = pkgs.openrgb-with-all-plugins;
    motherboard = "amd";
  };

  services.udisks2.enable = true;

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/1d19bf89-8827-4fa1-876d-cd00844abe8a";
    fsType = "ext4";
    options = [
      "defaults"
      "noatime"
    ];
  };
}
