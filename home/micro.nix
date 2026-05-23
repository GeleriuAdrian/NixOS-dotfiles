{ config, pkgs, ... }:

{
    home.file.".config/micro/settings.json".text = ''
        {
            "softwrap": true
        }
    '';
}
