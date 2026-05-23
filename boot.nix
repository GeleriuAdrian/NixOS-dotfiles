{ pkgs, ... }:

{
  boot.plymouth = {
    enable = true;
    theme = "lone";
    themePackages = [
      (pkgs.stdenv.mkDerivation {
        pname = "plymouth-theme-lone";
        version = "1.0";
        src = ./themes/lone;
        dontUnpack = true;

        installPhase = ''
          # Create the exact directory structure Plymouth expects
          mkdir -p $out/share/plymouth/themes/lone

          # Copy all files directly into the theme folder
          cp -r ./* $out/share/plymouth/themes/lone/

          # Force the path in the config to be absolute so it doesn't get lost
          sed -i 's|ImageDir=.*|ImageDir=/run/current-system/sw/share/plymouth/themes/lone|g' $out/share/plymouth/themes/lone/lone.plymouth
          sed -i 's|ScriptFile=.*|ScriptFile=/run/current-system/sw/share/plymouth/themes/lone/lone.script|g' $out/share/plymouth/themes/lone/lone.plymouth
        '';
      })
    ];
  };
}
