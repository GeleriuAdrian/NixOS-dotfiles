{ pkgs, ... }:

{
  boot.plymouth = {
    enable = true;
    theme = "lone";
    themePackages = [
      (pkgs.stdenv.mkDerivation {
        pname = "plymouth-theme-lone";
        version = "1.0";
        src = pkgs.fetchFromGitHub {
          owner = "adi1090x";
          repo = "plymouth-themes";
          rev = "master";
          sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # Update this
        };
        installPhase = ''
          mkdir -p $out/share/plymouth/themes/lone
          cp -r packs/lone/* $out/share/plymouth/themes/lone/
        '';
      })
    ];
  };
}
