{ config, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        settings = [{
            layer = "bottom";
            position = "top";
            height = 36;
            width = 1440;
            margin-top = 8;
            margin-left = 240;
            margin-right = 240;
            exclusive = true;

            modules-left = [ "custom/power" "hyprland/workspaces" ];
            modules-center = [ "hyprland/window" ];
            modules-right = [ "custom/brightness" "clock" ];

            "custom/power" = {
                format = "⏻";
                on-click = "shutdown now";
                tooltip = false;
            };

            "hyprland/workspaces" = {
                format = "{icon}";
                on-click = "activate";
                persistent-workspaces = { "*" = 3; };
                format-icons = {
                    active = "●";
                    default = "○";
                };
            };

            "hyprland/window" = {
                format = "{}";
            };

            "custom/brightness" = {
                format = "󰃠 {}%";
                interval = 10;
                exec = "ddcutil getvcp 10 | grep -oP '(?<=current value =\\s{1,5})\\d+'";
                on-scroll-up = "ddcutil setvcp 10 + 5 --noverify";
                on-scroll-down = "ddcutil setvcp 10 - 5 --noverify";
                tooltip = false;
            };

            clock = {
                format = "{:%H:%M}";
                format-alt = "{:%A, %d %B %Y}";
            };
        }];

        style = ''
            * {
                font-family: "${config.theme.font}";
                font-size: ${toString config.theme.fontSize}px;
                border: none;
                border-radius: 0;
            }

            window#waybar {
            	border-radius: ${toString config.theme.rounding}px;                
            	background: ${config.theme.bgAlpha};
                color: ${config.theme.fg};
            }

            #custom-power {
                color: ${config.theme.fgDim};
                padding: 0 12px;
                font-size: 18px;
            }
            
            #custom-power:hover {
                color: #ff5555;
            }

            #workspaces button {
                padding: 0 8px;
                color: ${config.theme.fgDim};
                background: transparent;
            }

            #workspaces button.active {
                color: ${config.theme.accent};
            }

            #window {
                color: ${config.theme.accent};
            }

            #clock {
                color: ${config.theme.accent};
                padding: 0 16px;
                font-size: 22px;
                font-weight: bold;
            }

            #custom-brightness {
                margin-right: 6px;
                padding: 0 10px;
                color: ${config.theme.fg};
            }
        '';
    };
}
