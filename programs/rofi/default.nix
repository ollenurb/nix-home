{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = "${pkgs.alacritty}/bin/alacritty";
    theme = ./theme.rafi;
    font = "FuraCode Nerd Font 16";
    # width = 35;
    # lines = 10;
    extraConfig = {
      show-icons = true;
    };
  };
}
