{ ... }:

{
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
  services.xserver.xkb.layout = "us";

  # hardware.i2c.enable = true;
  boot.kernelModules = [ "i2c-dev" ];
}
