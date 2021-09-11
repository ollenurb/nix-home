{ config, pkgs, ... }:

{
  services.picom = {
    enable = true;
    shadow = true;
    shadowOpacity = "0.6";
    shadowOffsets = [ 0  (-2) ];
    fade = true;
    fadeDelta = 5;
    fadeSteps = [ "0.03"  "0.03" ];
  };
}
