{ pkgs, ... }:

{
  boot.plymouth = {
    enable = true;
    theme = "lone";
    themePackages = [
      (pkgs.stdenv.mkDerivation {
        pname = "plymouth-theme-lone";
        version = "1.0";
        src = "/home/ady/dotfiles/themes/lone";
        installPhase = ''
          mkdir -p $out/share/plymouth/themes
          cp -r packs/lone $out/share/plymouth/themes/lone
        '';
      })
    ];
  };
}
