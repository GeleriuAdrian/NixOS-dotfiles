{ pkgs, ... }:

{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd # OpenCL via ROCm
        rocmPackages.clr # HIP runtime
      ];
    };
    i2c.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.Policy.AutoEnable = "true";
    };
    amdgpu.opencl.enable = true;
  };

  services.blueman.enable = true;
  services.xserver.xkb.layout = "us";

  # hardware.i2c.enable = true;
  boot.kernelModules = [ "i2c-dev" ];

  # Make sure ROCm knows about your GPU's target
  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1"; # not needed for 7700 XT but harmless
    HSA_OVERRIDE_GFX_VERSION = "11.0.0"; # gfx1100 for RDNA3
  };
}
