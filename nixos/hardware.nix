{ pkgs, ... }:
let
  amdOcl = pkgs.rocmPackages.clr.icd;
in
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
        rocmPackages.clr.icd
        rocmPackages.clr
        rocmPackages.rocm-runtime
      ];
    };
    amdgpu.opencl.enable = true;
    i2c.enable = true;
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.Policy.AutoEnable = "true";
    };
  };

  environment.variables = {
    ROC_ENABLE_PRE_VEGA = "1";
    HSA_OVERRIDE_GFX_VERSION = "11.0.0";
    OCL_ICD_VENDORS = "${amdOcl}/etc/OpenCL/vendors";
    ROCM_PATH = "${pkgs.rocmPackages.clr}";
  };

  services.blueman.enable = true;
  services.xserver.xkb.layout = "us";
  boot.kernelModules = [ "i2c-dev" ];
}
