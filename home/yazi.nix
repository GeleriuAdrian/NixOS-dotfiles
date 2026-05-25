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
        cwd = {
          fg = "${config.theme.accent}";
        };
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
        marker_copied = {
          fg = "${config.theme.accentSoft}";
          bg = "${config.theme.accentSoft}";
        };
        marker_cut = {
          fg = "#ff5555";
          bg = "#ff5555";
        };
        tab_active = {
          fg = "${config.theme.bg}";
          bg = "${config.theme.accent}";
        };
        tab_inactive = {
          fg = "${config.theme.fg}";
          bg = "${config.theme.bgTerminal}";
        };
        border_style = {
          fg = "${config.theme.borderGray}";
        };
      };
      status = {
        mode_normal = {
          fg = "${config.theme.bg}";
          bg = "${config.theme.accent}";
          bold = true;
        };
        mode_select = {
          fg = "${config.theme.bg}";
          bg = "${config.theme.accentSoft}";
          bold = true;
        };
        mode_unset = {
          fg = "${config.theme.bg}";
          bg = "${config.theme.accentDim}";
          bold = true;
        };
        progress_normal = {
          fg = "${config.theme.accent}";
          bg = "${config.theme.bgTerminal}";
        };
        progress_error = {
          fg = "#ff5555";
          bg = "${config.theme.bgTerminal}";
        };
        permissions_t = {
          fg = "${config.theme.accent}";
        };
        permissions_r = {
          fg = "${config.theme.accentSoft}";
        };
        permissions_w = {
          fg = "#ff5555";
        };
        permissions_x = {
          fg = "${config.theme.accentDim}";
        };
        permissions_s = {
          fg = "${config.theme.fgDim}";
        };
      };
      input = {
        border = {
          fg = "${config.theme.accent}";
        };
        title = {
          fg = "${config.theme.accent}";
        };
        value = {
          fg = "${config.theme.fg}";
        };
        selected = {
          reversed = true;
        };
      };
      select = {
        border = {
          fg = "${config.theme.accent}";
        };
        active = {
          fg = "${config.theme.accent}";
        };
        inactive = {
          fg = "${config.theme.fgDim}";
        };
      };
      filetype = {
        rules = [
          {
            mime = "image/*";
            fg = "#ff88ff";
          }
          {
            mime = "video/*";
            fg = "#ff8800";
          }
          {
            mime = "audio/*";
            fg = "${config.theme.accentSoft}";
          }
          {
            mime = "application/zip";
            fg = "#ff5555";
          }
          {
            mime = "application/gzip";
            fg = "#ff5555";
          }
          {
            mime = "application/pdf";
            fg = "#ff8800";
          }
          {
            name = "*.nix";
            fg = "${config.theme.accent}";
          }
          {
            name = "*.cpp";
            fg = "#88ccff";
          }
          {
            name = "*.h";
            fg = "#aaddff";
          }
          {
            name = "*.c";
            fg = "#88ccff";
          }
          {
            name = "*.py";
            fg = "#ffff88";
          }
          {
            name = "*";
            fg = "${config.theme.fg}";
          }
        ];
      };
    };
  };
}
