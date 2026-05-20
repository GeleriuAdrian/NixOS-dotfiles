{ config, pkgs, ... }:

{
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            starship init fish | source
            set fish_greeting "hey ady!"
            set fish_color_autosuggestion ${config.theme.accentDim}
        '';
        shellAbbrs = {
            # NixOS
            rebuild      = "sudo nixos-rebuild switch";
            update       = "sudo nix-channel --update && sudo nixos-rebuild switch";
            clean        = "sudo nix-collect-garbage -d";
        
            # Configs
            conf         = "sudo micro /etc/nixos/configuration.nix";
            themeconf    = "sudo micro /etc/nixos/home/theme.nix";
            hyprconf     = "sudo micro /etc/nixos/home/hyprland.nix";
            wayconf      = "sudo micro /etc/nixos/home/waybar.nix";
            fishconf     = "sudo micro /etc/nixos/home/fish.nix";
            makoconf     = "sudo micro /etc/nixos/home/mako.nix";
            woficonf     = "sudo micro /etc/nixos/home/wofi.nix";
            hyprpaperconf = "sudo micro /etc/nixos/home/hyprpaper.nix";
            alacconf     = "sudo micro /etc/nixos/home/alacritty.nix";
            swayosdconf  = "sudo micro /etc/nixos/home/swayosd.nix";
        
            # System info
            boottime     = "systemd-analyze";
            blame        = "systemd-analyze blame";
            services     = "systemctl list-units --type=service --state=running";
            temps        = "sensors";
        
            # Dotfiles
            dotpush      = "cd ~/dotfiles && cp /etc/nixos/configuration.nix ~/dotfiles/nixos/ && cp /etc/nixos/hardware-configuration.nix ~/dotfiles/nixos/ && cp /etc/nixos/home/alacritty.nix ~/dotfiles/home/ && cp /etc/nixos/home/hyprland.nix ~/dotfiles/home/ && cp /etc/nixos/home/hyprpaper.nix ~/dotfiles/home/ && cp /etc/nixos/home/waybar.nix ~/dotfiles/home/ && cp /etc/nixos/home/fish.nix ~/dotfiles/home/ && cp /etc/nixos/home/mako.nix ~/dotfiles/home/ && cp /etc/nixos/home/wofi.nix ~/dotfiles/home/ && cp /etc/nixos/home/theme.nix ~/dotfiles/home/ && cp /etc/nixos/home/swayosd.nix ~/dotfiles/home/ && git add . && git commit -m \"update dotfiles\" && git push";
        
            # Power
            off          = "shutdown now";
            reboot       = "systemctl reboot";
        };
    };

    programs.starship = {
        enable = true;
        settings = {
            format = "$directory$git_branch$git_status$character";
            character = {
                success_symbol = "[❯](bold ${config.theme.accent})";
                error_symbol = "[❯](bold red)";
            };
            directory.style = "${config.theme.accent}";
            git_branch = {
                symbol = " ";
                style = "${config.theme.accentDim}";
            };
            git_status.style = "${config.theme.accent}";
        };
    };
}
