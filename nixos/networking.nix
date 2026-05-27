{ ... }:

{
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
}
