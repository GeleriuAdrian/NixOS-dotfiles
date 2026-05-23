{ config, pkgs, ... }:

{
  programs.qutebrowser = {
    enable = true;
    loadAutoconfig = false; # Disables the in-browser UI settings so your Nix file is the absolute source of truth

    # Clean, native Chromium engine adblocking
    searchEngines = {
      DEFAULT = "https://duckduckgo.com/?q={}";
      g = "https://www.google.com/search?q={}";
      nw = "https://wiki.nixos.org/w/index.php?search={}";
    };

    settings = {
      # Wayland and backend adjustments
      qt.args = [ "enable-gpu-rasterization" "enable-accelerated-video-decode" ];
      
      # UI minimalism matching your Hyprland style
      tabs.position = "top"; # Minimalist vertical tabs
      tabs.width = "15%";
      tabs.show = "always";
      statusbar.show = "always";
      # scrolling.bar = "never"; # Keeps it incredibly clean

      # Fonts (Leveraging your system's JetBrains Mono)
      fonts.default_family = "JetBrainsMono Nerd Font";
      fonts.default_size = "11pt";

      # Quick color match template (you can tie these into your custom theme.nix variables later!)
      colors = {
        tabs.bar.bg = "#11111b";
        tabs.even.bg = "#1e1e2e";
        tabs.odd.bg = "#1e1e2e";
        tabs.selected.even.bg = "#89b4fa";
        tabs.selected.even.fg = "#11111b";
        tabs.selected.odd.bg = "#89b4fa";
        tabs.selected.odd.fg = "#11111b";
        
        statusbar.normal.bg = "#11111b";
        statusbar.insert.bg = "#a6e3a1";
        statusbar.insert.fg = "#11111b";
      };
    };

    # Vim-style keybindings and extra shortcuts
    keyBindings = {
      normal = {
        # Bind a shortcut to spawn videos instantly in mpv
        ",m" = "spawn mpv {url}";
        ",M" = "hint links spawn mpv {hint-url}";
        
        # Fast tab switching
        "J" = "tab-prev";
        "K" = "tab-next";
      };
    };
  };
}
