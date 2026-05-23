{ config, ... }:

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
      rebuild = "sudo nixos-rebuild switch --flake ~/dotfiles#nixos";
      update = "sudo nix-channel --update && sudo nixos-rebuild switch";
      clean = "sudo nix-collect-garbage -d";

      # System info
      boottime = "systemd-analyze";
      blame = "systemd-analyze blame";
      services = "systemctl list-units --type=service --state=running";
      temps = "sensors";

      # Dotfiles
      dots = "zeditor ~/dotfiles";
      dotpush = "cd ~/dotfiles && git add . && git commit -m 'update dotfiles' && git push";

      # Power
      off = "shutdown now";
      reboot = "systemctl reboot";
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
