# Testing
{ pkgs, ... }:

{
  # Enabling dconf allow the use of gsettings
  programs.dconf.enable = true;
  services = {
    dbus = {
      enable = true;
      packages = [ pkgs.gnome3.dconf ];
    };
    # Xorg-configurations
    xserver = {
      enable = true;
      layout = "us";
      autorun = true;
      videoDrivers = ["intel"];
      # Display Manager configurations
      displayManager = {
        defaultSession = "none+i3";
        autoLogin.enable = true;
        autoLogin.user = "matteo";
        lightdm.greeter.enable = false;
      };
      # i3-configurations
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        configFile = ./i3-config;
      };
    };
  };
}
