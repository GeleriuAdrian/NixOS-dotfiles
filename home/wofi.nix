{ config, pkgs, ... }:
{
    programs.wofi = {
        enable = true;
        settings = {
                width = 500;
                height = 300;
                location = "center";
                show = "drun";
                prompt = "Search";
                insensitive = true;
                no_actions = true;
        };
        style = ''
            * {
                font-family: ${config.theme.font};
                font-size: 16px;
            }
            window {
                background-color: ${config.theme.bgSolid};
                border: 2px solid ${config.theme.borderGray};
                border-radius: ${toString config.theme.rounding}px;
            }
            #input {
                background-color: rgba(255, 255, 255, 0.05);
                border: none;
                border-radius: ${toString config.theme.rounding}px;
                color: ${config.theme.fg};
                padding: 8px 12px;
                margin: 8px;
            }
           #input:focus {
                border: 1px solid ${config.theme.accent};
                outline: none;
                box-shadow: none;
                margin: 7px;
            }
            #input image {
                color: ${config.theme.accent};
            }
            #inner-box {
                background: transparent;
            }
            #outer-box {
                padding: 12px 10px 10px 10px;
            }
            #entry {
                padding: 6px 12px;
                border-radius: 6px;
                color: ${config.theme.fgDim};
            }
            #entry:selected {
                background-color: transparent;
                color: ${config.theme.accent};
                box-shadow: none;
                outline: none;
                border: none;
            }
            
            #entry:selected * {
                color: ${config.theme.accent};
                outline: none;
            }
            
            flowbox > flowboxchild:selected {
                outline: none;
                border: none;
            }
        '';
    };
}
