{ config, ... }:

{
  # Drop the theme file where Zed picks it up automatically
  home.file.".config/zed/themes/nixgreen.json".source = ./zed-theme.json;

  programs.zed-editor = {
    enable = true;

    extensions = [ "nix" ];

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

      # Wayland
      window_decorations = "Client";

      # Editor feel
      vim_mode = false;
      relative_line_numbers = false;
      cursor_blink = false;
      show_whitespaces = "selection";
      soft_wrap = "editor_width";

      # Scrollbar
      scrollbar = {
        show = "never";
      };

      # Terminal
      terminal = {
        font_family = config.theme.font;
        font_size = config.theme.termFontSize;
        shell = {
          program = "fish";
        };
        env = {
          TERM = "xterm-256color";
        };
      };
    };
  };
}
