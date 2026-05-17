{ config, pkgs, ... }:

{
    programs.waybar = {
        enable = true;
        settings = [{
            layer = "bottom";
            position = "top";
            height = 36;
            spacing = 4;

            modules-left = [ "hyprland/workspaces" ];
            modules-center = [ "hyprland/window" ];
            modules-right = [ "custom/brightness" "pulseaudio" "clock" ];

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

            pulseaudio = {
                format = "{icon} {volume}%";
                format-muted = "󰝟 muted";
                format-icons = {
                    default = [ "󰕿" "󰖀" "󰕾" ];
                };
                on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ --limit 1.5";
                on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
                on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
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
                background: ${config.theme.bgAlpha};
                color: ${config.theme.fg};
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
            }

            #custom-brightness {
                margin-right: 6px;
                padding: 0 10px;
                color: ${config.theme.fg};
            }

            #pulseaudio {
                margin-left: 6px;
                padding: 0 10px;
                color: ${config.theme.fg};
            }
        '';
    };
}
