{ config, ... }:
{
  gtk = {
    enable = true;
    theme = {
      name = "Everforest-BL-MB-Dark";
    };
    font = {
      name = "JetBrains Mono";
      size = 11;
    };
    gtk4.theme = config.gtk.theme;
  };

  # Needed for GTK4 apps (like Nautilus, newer GNOME apps)
  home.sessionVariables = {
    GTK_THEME = "Everforest-BL-MB-Dark";
  };

}
