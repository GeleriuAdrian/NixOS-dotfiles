{ ... }:

{
  security = {
    polkit.enable = true;
    sudo.extraRules = [
      {
        users = [ "ady" ];
        commands = [
          {
            command = "ALL";
            options = [ "NOPASSWD" ];
          }
        ];
      }
    ];
    pam.services.greetd.enableGnomeKeyring = true;
  };

  services.gnome.gnome-keyring.enable = true;
}
