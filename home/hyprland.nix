{ config, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    settings = {
      monitor = ", 1920x1080@144, auto, 1";

      exec-once = [
        "/run/current-system/sw/bin/gnome-keyring-daemon --start --components=secrets"
        "/run/current-system/sw/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
        "gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark"
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
        gaps_in = config.theme.gapsIn;
        gaps_out = config.theme.gapsOut;
        border_size = config.theme.borderSize;
        "col.active_border" =
          "${config.theme.borderActive} rgba(${lib.removePrefix "#" config.theme.accentDim}ff) 45deg";
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
        inactive_opacity = config.theme.inactiveOpacity;
        blur = {
          enabled = true;
          size = config.theme.blurSize;
          passes = config.theme.blurPasses;
          new_optimizations = true;
          xray = false;
          noise = 0.02;
          contrast = 1.0;
          brightness = 0.8;
          vibrancy = config.theme.vibrancy;
          vibrancy_darkness = 0.1;
        };
        shadow = {
          enabled = true;
          range = config.theme.shadowRange;
          render_power = config.theme.shadowPower;
          color = "${config.theme.shadowColor}";
          offset = "${config.theme.shadowOffset}";
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

      windowrule = [
        "match:class ^(loupe)$, float 1"
        "match:class ^(nwg-look)$, float 1"
        "match:class ^(qt6ct)$, float 1"
        # Workspace assignments
        "match:class ^(zeditor|Zed)$, workspace 2"
        "match:class ^(Steam|steam)$, workspace 3"
        "match:class ^(steam_app_.*)$, workspace 3"

        # Games fullscreen
        "match:class ^(steam_app_.*)$, fullscreen 1"
      ];

      "$mod" = "SUPER";
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

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
        ", Print, exec, grimblast copysave area $HOME/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png"
        "$mod SHIFT, F, fullscreenstate, 0 2"
        "$mod SHIFT, P, exec, wlogout"
        ", XF86Explorer, exec, thunar"
        ", XF86HomePage, exec, librewolf"
        ", XF86Mail, exec, thunderbird"
        ", XF86Calculator, exec, wofi --show calc -modi calc --no-residual"
      ];

      bindl = [
        ", XF86AudioRaiseVolume, exec, swayosd-client --output-volume raise --max-volume 150"
        ", XF86AudioLowerVolume, exec, swayosd-client --output-volume lower"
        ", XF86AudioMute, exec, swayosd-client --output-volume mute-toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioStop, exec, playerctl stop"
      ];
    };
  };
}
