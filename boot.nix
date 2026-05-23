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
          # 1. Create the exact directory structure Plymouth expects
          mkdir -p $out/share/plymouth/themes/lone

          # 2. Copy explicitly from the $src variable, NOT the empty current directory
          cp -r $src/* $out/share/plymouth/themes/lone/

          # 3. Use double quotes so Bash evaluates $out, giving Plymouth the hard Nix store paths it needs during early boot
          sed -i "s|ImageDir=.*|ImageDir=$out/share/plymouth/themes/lone|g" $out/share/plymouth/themes/lone/lone.plymouth
          sed -i "s|ScriptFile=.*|ScriptFile=$out/share/plymouth/themes/lone/lone.script|g" $out/share/plymouth/themes/lone/lone.plymouth
        '';
      })
    ];
  };
}
