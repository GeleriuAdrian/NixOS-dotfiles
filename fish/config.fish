if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
abbr rebuild 'sudo nixos-rebuild switch'
abbr conf 'sudo micro /etc/nixos/configuration.nix'
abbr hyprconf 'micro ~/.config/hypr/hyprland.conf'
abbr wayconf 'micro ~/.config/waybar/config.jsonc'
abbr waycss 'micro ~/.config/waybar/style.css'
abbr alacconf 'micro ~/.config/alacritty/alacritty.toml'
abbr fishconf 'micro ~/.config/fish/config.fish'
abbr wayrestart 'pkill waybar && waybar &disown'
abbr boottime 'systemd-analyze'
abbr temps 'sensors'
abbr update 'sudo nix-channel --update && sudo nixos-rebuild switch'
abbr clean 'sudo nix-collect-garbage -d'
