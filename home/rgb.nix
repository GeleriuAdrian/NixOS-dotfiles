{ pkgs, ... }:

let
  my-rgb = pkgs.writeScriptBin "my-rgb" ''
    #!/bin/sh
    ${pkgs.openrgb}/bin/openrgb --noautoconnect --device 0 --zone 0 --mode static --color aaee66
    ${pkgs.openrgb}/bin/openrgb --noautoconnect --device 0 --zone 1 --mode static --color aaee66
    ${pkgs.openrgb}/bin/openrgb --noautoconnect --device 0 --zone 2 --mode static --color aaee66
    ${pkgs.openrgb}/bin/openrgb --noautoconnect --device 0 --zone 3 --mode static --color aaee66
  '';
in
{
  environment.systemPackages = [ my-rgb ];

  systemd.services.my-rgb = {
    description = "Set RGB lighting to green on boot";
    after = [ "multi-user.target" "openrgb.service" ];
    wants = [ "openrgb.service" ];
    serviceConfig = {
      ExecStart = "${my-rgb}/bin/my-rgb";
      Type = "oneshot";
      RemainAfterExit = true;
    };
    wantedBy = [ "multi-user.target" ];
  };
}
