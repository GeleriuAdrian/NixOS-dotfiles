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
            rebuild      = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos";
            update       = "sudo nix-channel --update && sudo nixos-rebuild switch";
            clean        = "sudo nix-collect-garbage -d";
        
            # Configs
            conf         = "sudo micro ~/dotfiles/configuration.nix";
            themeconf    = "sudo micro ~/dotfiles/home/theme.nix";
            hyprconf     = "sudo micro ~/dotfiles/home/hyprland.nix";
            wayconf      = "sudo micro ~/dotfiles/home/waybar.nix";
            fishconf     = "sudo micro ~/dotfiles/home/fish.nix";
            makoconf     = "sudo micro ~/dotfiles/home/mako.nix";
            woficonf     = "sudo micro ~/dotfiles/home/wofi.nix";
            hyprpaperconf = "sudo micro ~/dotfiles/home/hyprpaper.nix";
            alacconf     = "sudo micro ~/dotfiles/home/alacritty.nix";
            swayosdconf  = "sudo micro ~/dotfiles/home/swayosd.nix";
        
            # System info
            boottime     = "systemd-analyze";
            blame        = "systemd-analyze blame";
            services     = "systemctl list-units --type=service --state=running";
            temps        = "sensors";
        
            # Dotfiles
            dotpush="cd ~/dotfiles && git add . && git commit -m 'update dotfiles' && git push";
        
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
