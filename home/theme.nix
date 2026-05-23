{ lib, ... }:

{
  options.theme = {
    # Colors
    accent = lib.mkOption {
      type = lib.types.str;
      default = "#aaee66";
    };
    accentDim = lib.mkOption {
      type = lib.types.str;
      default = "#88cc44";
    };
    accentSoft = lib.mkOption {
      type = lib.types.str;
      default = "#cce899";
    };
    bg = lib.mkOption {
      type = lib.types.str;
      default = "#0a0a0f";
    };
    bgTerminal = lib.mkOption {
      type = lib.types.str;
      default = "#172905";
    };
    bgAlpha = lib.mkOption {
      type = lib.types.str;
      default = "rgba(10, 10, 15, 0.4)";
    };
    bgSolid = lib.mkOption {
      type = lib.types.str;
      default = "rgba(10, 10, 15, 0.9)";
    };
    bgMako = lib.mkOption {
      type = lib.types.str;
      default = "#0a0a0fcc";
    };
    fg = lib.mkOption {
      type = lib.types.str;
      default = "#e0e0e0";
    };
    fgDim = lib.mkOption {
      type = lib.types.str;
      default = "#888888";
    };
    borderActive = lib.mkOption {
      type = lib.types.str;
      default = "rgba(aaee66ff)";
    };
    borderInactive = lib.mkOption {
      type = lib.types.str;
      default = "rgba(44444466)";
    };
    borderGray = lib.mkOption {
      type = lib.types.str;
      default = "#444444";
    };
    shadowColor = lib.mkOption {
      type = lib.types.str;
      default = "rgba(0, 0, 0, 0.5)";
    };
    osdTrough = lib.mkOption {
      type = lib.types.str;
      default = "#1a1a2e";
    };

    # Typography
    font = lib.mkOption {
      type = lib.types.str;
      default = "JetBrains Mono";
    };
    fontSize = lib.mkOption {
      type = lib.types.int;
      default = 18;
    };
    termFontSize = lib.mkOption {
      type = lib.types.int;
      default = 13;
    };
    makoFontSize = lib.mkOption {
      type = lib.types.int;
      default = 11;
    };
    clockFontSize = lib.mkOption {
      type = lib.types.int;
      default = 22;
    };

    # Layout
    rounding = lib.mkOption {
      type = lib.types.int;
      default = 10;
    };
    gapsIn = lib.mkOption {
      type = lib.types.int;
      default = 4;
    };
    gapsOut = lib.mkOption {
      type = lib.types.int;
      default = 8;
    };
    borderSize = lib.mkOption {
      type = lib.types.int;
      default = 0;
    };
    shadowRange = lib.mkOption {
      type = lib.types.int;
      default = 20;
    };
    shadowPower = lib.mkOption {
      type = lib.types.int;
      default = 2;
    };
    shadowOffset = lib.mkOption {
      type = lib.types.str;
      default = "0 4";
    };
    blurSize = lib.mkOption {
      type = lib.types.int;
      default = 5;
    };
    blurPasses = lib.mkOption {
      type = lib.types.int;
      default = 3;
    };
    vibrancy = lib.mkOption {
      type = lib.types.float;
      default = 0.3;
    };
    termOpacity = lib.mkOption {
      type = lib.types.float;
      default = 0.50;
    };
    inactiveOpacity = lib.mkOption {
      type = lib.types.float;
      default = 0.95;
    };
  };
}
