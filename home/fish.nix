{ config, pkgs, ... }:

{
    programs.fish = {
        enable = true;
        interactiveShellInit = ''
            starship init fish | source
        '';
        shellAbbrs = {
            rebuild = "sudo nixos-rebuild switch";
            conf = "sudo micro /etc/nixos/configuration.nix";
            hyprconf = "sudo micro /etc/nixos/home/hyprland.nix";
            wayconf = "sudo micro /etc/nixos/home/waybar.nix";
            fishconf = "sudo micro /etc/nixos/home/fish.nix";
            makoconf = "sudo micro /etc/nixos/home/mako.nix";
            woficonf = "sudo micro /etc/nixos/home/wofi.nix";
            hyprpaperconf = "sudo micro /etc/nixos/home/hyprpaper.nix";
            alacconf = "sudo micro /etc/nixos/home/alacritty.nix";
            wayrestart = "pkill waybar && waybar &disown";
            boottime = "systemd-analyze";
            blame = "systemd-analyze blame";
            services = "systemctl list-units --type=service --state=running";
            temps = "sensors";
            update = "sudo nix-channel --update && sudo nixos-rebuild switch";
            clean = "sudo nix-collect-garbage -d";
            dotpush = "cd ~/dotfiles && cp /etc/nixos/configuration.nix ~/dotfiles/nixos/ && cp /etc/nixos/home/hyprland.nix ~/dotfiles/home/ && cp /etc/nixos/home/waybar.nix ~/dotfiles/home/ && cp /etc/nixos/home/fish.nix ~/dotfiles/home/ && cp /etc/nixos/home/mako.nix ~/dotfiles/home/ && cp /etc/nixos/home/wofi.nix ~/dotfiles/home/ && cp /etc/nixos/home/hyprpaper.nix ~/dotfiles/home/ && cp /etc/nixos/home/alacritty.nix ~/dotfiles/home/ && git add . && git commit -m \"update dotfiles\" && git push";
        };
    };

    programs.starship = {
        enable = true;
        settings = {
            format = "$directory$git_branch$git_status$character";
            character = {
                success_symbol = "[❯](bold #aaee66)";
                error_symbol = "[❯](bold red)";
            };
            directory.style = "#aaee66";
            git_branch = {
                symbol = " ";
                style = "#88cc44";
            };
            git_status.style = "#aaee66";
        };
    };
}
