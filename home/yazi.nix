{ config, ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    settings = {
      manager = {
        ratio = [
          1
          3
          4
        ];
        sort_by = "natural";
        sort_dir_first = true;
        show_hidden = false;
        show_symlink = true;
      };
    };
    theme = {
      manager = {
        hovered = {
          fg = "${config.theme.bg}";
          bg = "${config.theme.accent}";
        };
        preview_hovered = {
          underline = true;
        };
        find_keyword = {
          fg = "${config.theme.accent}";
          bold = true;
        };
        find_position = {
          fg = "${config.theme.accentSoft}";
          italic = true;
        };
        marker_selected = {
          fg = "${config.theme.accent}";
          bg = "${config.theme.accent}";
        };
        tab_active = {
          fg = "${config.theme.bg}";
          bg = "${config.theme.accent}";
        };
        tab_inactive = {
          fg = "${config.theme.fg}";
          bg = "${config.theme.bgTerminal}";
        };
      };
    };
  };
}
