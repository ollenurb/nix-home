{ config, pkgs, ... }:

let
  myPolybar = pkgs.polybar.override {
    i3GapsSupport = true;
    alsaSupport = true;
    iwSupport = true;
    githubSupport = true;
    pulseSupport = true;
  };

  battScript = pkgs.callPackage ./scripts/batterycomb.nix {};

  batteryCombinedModule = ''
    [module/battery-combined]
    type = custom/script
    exec = ${battScript}/bin/batterycomb
    format = <label>
    format-foreground = ''${colors.Black}
    format-background = ''${colors.DarkGrey} 
    label = %output%

    interval = 5
  '';

  customModules = batteryCombinedModule;
in
{

  services.polybar = {
    enable = true;
    package = myPolybar;
    config = ./config.ini;
    extraConfig = customModules;
    script = ''
  polybar top &
  '';
  };
}
