{ config, pkgs, ... }:

{
    services.swayosd = {
        enable = true;
        topMargin = 0.9;
    };

    home.file.".config/swayosd/config.toml".text = ''
    	[server]
   	    top_margin = 0.9
   	    show_percentage = true
    '';

    home.file.".config/swayosd/style.css".text = ''
        window {
            background: none;
        }

        #osd {
            background-color: ${config.theme.bgSolid};
            border: 1px solid ${config.theme.borderGray};
            border-radius: 24px;
            padding: 8px 16px;
        }

        progressbar,
        progressbar trough,
        progressbar trough progress {
            min-height: 6px;
            border-radius: 6px;
        }

        progressbar trough {
            background-color: ${config.theme.osdTrough};
        }

        progressbar trough progress {
            background-color: ${config.theme.accent};
        }

        image {
            color: ${config.theme.accent};
        }
    '';
}
