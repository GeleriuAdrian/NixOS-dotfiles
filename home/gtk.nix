{ config, pkgs, lib, ... }:

{
    gtk = {
        enable = true;
        theme = {
            name = "NixGreen";
            package = pkgs.stdenv.mkDerivation {
                name = "NixGreen";
                src = ./gtk-theme;
                installPhase = ''
                    mkdir -p $out/share/themes/NixGreen
                    cp -r * $out/share/themes/NixGreen/
                '';
            };
        };
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
        };
        cursorTheme = {
            name = "Bibata-Modern-Classic";
            package = pkgs.bibata-cursors;
            size = 24;
        };
        gtk3.extraCss = ''
            window {
                background-color: ${config.theme.bg};
            }
        
            headerbar {
                background-color: #0f0f14;
                border-bottom: 1px solid ${config.theme.borderGray};
                color: ${config.theme.fg};
            }
        
            button {
                background-color: #1a1a2e;
                border: 1px solid ${config.theme.borderGray};
                border-radius: ${toString config.theme.rounding}px;
                color: ${config.theme.fg};
                padding: 4px 12px;
            }
        
            button:hover {
                background-color: #2a2a3e;
                border-color: ${config.theme.accent};
            }
        
            button:active,
            button:checked {
                background-color: ${config.theme.accent};
                color: ${config.theme.bg};
            }
        
            entry {
                background-color: #0f0f14;
                border: 1px solid ${config.theme.borderGray};
                border-radius: ${toString config.theme.rounding}px;
                color: ${config.theme.fg};
                padding: 4px 8px;
            }
        
            entry:focus {
                border-color: ${config.theme.accent};
            }
        
            scrollbar trough {
                background-color: #0f0f14;
            }
        
            scrollbar slider {
                background-color: ${config.theme.borderGray};
                border-radius: 4px;
            }
        
            scrollbar slider:hover {
                background-color: ${config.theme.accent};
            }
        '';
        gtk4.extraCss = ''
            window {
                background-color: ${config.theme.bg};
            }
        
            headerbar {
                background-color: #0f0f14;
                border-bottom: 1px solid ${config.theme.borderGray};
                color: ${config.theme.fg};
            }
        
            button {
                background-color: #1a1a2e;
                border: 1px solid ${config.theme.borderGray};
                border-radius: ${toString config.theme.rounding}px;
                color: ${config.theme.fg};
                padding: 4px 12px;
            }
        
            button:hover {
                background-color: #2a2a3e;
                border-color: ${config.theme.accent};
            }
        
            button:active,
            button:checked {
                background-color: ${config.theme.accent};
                color: ${config.theme.bg};
            }
        
            entry {
                background-color: #0f0f14;
                border: 1px solid ${config.theme.borderGray};
                border-radius: ${toString config.theme.rounding}px;
                color: ${config.theme.fg};
                padding: 4px 8px;
            }
        
            entry:focus {
                border-color: ${config.theme.accent};
            }
            
            scrollbar trough {
                background-color: #0f0f14;
            }
        
            scrollbar slider {
                background-color: ${config.theme.borderGray};
                border-radius: 4px;
            }
        
            scrollbar slider:hover {
                background-color: ${config.theme.accent};
            }
        '';
    };
}
