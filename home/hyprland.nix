{ config, pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            monitor = ", 1920x1080@144, auto, 1";

            exec-once = [
                "/run/current-system/sw/bin/gnome-keyring-daemon --start --components=secrets"
                "/run/current-system/sw/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
            ];

            env = [
                "LIBVA_DRIVER_NAME, radeonsi"
                "WLR_NO_HARDWARE_CURSORS, 1"
                "XCURSOR_THEME, Bibata-Modern-Classic"
                "XCURSOR_SIZE, 24"
            ];

            input = {
                kb_layout = "us";
                follow_mouse = 1;
                numlock_by_default = true;
                accel_profile = "flat";
                sensitivity = 0;
            };

            general = {
                gaps_in = 4;
                gaps_out = 8;
                border_size = 2;
                "col.active_border" = "${config.theme.borderActive} rgba(88cc44ff) 45deg";
                "col.inactive_border" = "${config.theme.borderInactive}";
                layout = "master";
                resize_on_border = true;
            };

            master = {
                new_status = "slave";
                mfact = 0.55;
            };

            decoration = {
                rounding = config.theme.rounding;
                active_opacity = 1.0;
                inactive_opacity = 0.9;
                blur = {
                    enabled = true;
                    size = 6;
                    passes = 3;
                    new_optimizations = true;
                };
                shadow = {
                    enabled = true;
                    range = 15;
                    render_power = 3;
                    color = "rgba(0, 0, 0, 0.4)";
                };
            };

            animations = {
                enabled = true;
                bezier = "smooth, 0.05, 0.9, 0.1, 1.0";
                animation = [
                    "windows, 1, 4, smooth, slide"
                    "fade, 1, 4, smooth"
                    "workspaces, 1, 7, smooth, slide"
                ];
            };

            windowrulev2 = [
                "float, class:(loupe)"
                "float, class:(dolphin)"
                "float, class:(nwg-look)"
                "float, class:(qt6ct)"
                "fullscreenstate 0 2, class:(steam_app_.*)"
                "suppressevent fullscreen, class:(steam_app_.*)"
            ];

            "$mod" = "SUPER";

            bind = [
                "$mod, Q, exec, alacritty"
                "$mod, SPACE, exec, wofi --show drun"
                "$mod, escape, killactive"
                "$mod, F, fullscreen"
                "$mod, T, togglefloating"
                "$mod, M, exit"
                "$mod, D, togglespecialworkspace, minimized"
                "$mod SHIFT, D, movetoworkspace, special:minimized"
                "$mod, left, movefocus, l"
                "$mod, right, movefocus, r"
                "$mod, up, movefocus, u"
                "$mod, down, movefocus, d"
                "$mod SHIFT, left, movewindow, l"
                "$mod SHIFT, right, movewindow, r"
                "$mod SHIFT, up, movewindow, u"
                "$mod SHIFT, down, movewindow, d"
                "$mod CTRL, left, resizeactive, -50 0"
                "$mod CTRL, right, resizeactive, 50 0"
                "$mod CTRL, up, resizeactive, 0 -50"
                "$mod CTRL, down, resizeactive, 0 50"
                "$mod, 1, workspace, 1"
                "$mod, 2, workspace, 2"
                "$mod, 3, workspace, 3"
                "$mod, 4, workspace, 4"
                "$mod, 5, workspace, 5"
                "$mod SHIFT, 1, movetoworkspace, 1"
                "$mod SHIFT, 2, movetoworkspace, 2"
                "$mod SHIFT, 3, movetoworkspace, 3"
                "$mod SHIFT, 4, movetoworkspace, 4"
                "$mod SHIFT, 5, movetoworkspace, 5"
                "ALT, Tab, cyclenext"
                "ALT SHIFT, Tab, cyclenext, prev"
                ", Print, exec, grimblast copy area"
                "$mod SHIFT, F, fullscreenstate, 0 2"
                "$mod SHIFT, P, exec, wlogout"
            ];

            bindl = [
                ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
                ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
            ];
        };
    };
}
