{ config, pkgs, ... }:

{
  virtualisation.docker.enable = true;

  virtualisation.oci-containers.backend = "docker";
  virtualisation.oci-containers.containers.actual = {
    image = "actualbudget/actual-server:latest";
    ports = [ "5006:5006" ];
    volumes = [ "/var/lib/actual:/data" ];
    autoStart = true;
  };
}
