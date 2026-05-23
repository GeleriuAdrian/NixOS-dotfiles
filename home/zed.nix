{ config, ... }:

{
  programs.zed-editor = {
    enable = true;
    userSettings = {
      theme = {
        mode = "dark";
        dark = "NixGreen";
        light = "NixGreen";
      };
      ui_font_family = config.theme.font;
      ui_font_size = config.theme.fontSize;
      buffer_font_family = config.theme.font;
      buffer_font_size = config.theme.termFontSize;
    };

    userKeymaps = [ ];

    extensions = [ "nix" ];

    extraPackages = [ ];
  };
}
