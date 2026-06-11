{ ... }:

{
  virtualisation.docker.enable = true;

  users.users.ady.extraGroups = [ "docker" ];
}
