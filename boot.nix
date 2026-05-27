{ pkgs, ... }:
{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
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
    plymouth = {
      enable = true;
      theme = "lone";
      themePackages = [
        (pkgs.stdenv.mkDerivation {
          pname = "plymouth-theme-lone";
          version = "1.0";
          src = ./themes/lone;
          dontUnpack = true;
          installPhase = ''
            mkdir -p $out/share/plymouth/themes/lone
            cp -r $src/* $out/share/plymouth/themes/lone/
            sed -i "s|ImageDir=.*|ImageDir=$out/share/plymouth/themes/lone|g" $out/share/plymouth/themes/lone/lone.plymouth
            sed -i "s|ScriptFile=.*|ScriptFile=$out/share/plymouth/themes/lone/lone.script|g" $out/share/plymouth/themes/lone/lone.plymouth
          '';
        })
      ];
    };
  };
}
