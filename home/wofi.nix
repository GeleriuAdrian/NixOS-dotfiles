{ config, pkgs, ... }:

{
    programs.wofi = {
        enable = true;
        style = ''
            * {
                font-family: ${config.theme.font};
                font-size: ${toString config.theme.termFontSize}px;
            }

            window {
                background-color: ${config.theme.bgSolid};
                border: 1px solid ${config.theme.border};
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

            #inner-box {
                background: transparent;
            }

            #outer-box {
                padding: 8px;
            }

            #entry {
                padding: 6px 12px;
                border-radius: 6px;
                color: ${config.theme.fgDim};
            }

            #entry:selected {
                background-color: rgba(170, 238, 102, 0.08);
                color: ${config.theme.accentSoft};
                border: none;
                outline: none;
            }
        '';
    };
}
