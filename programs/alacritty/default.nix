{  fontSize, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {

      font = {
        normal.family = "Iosevka Nerd Font Mono";
        size = 12.0;
      };

      shell = { program = "${pkgs.zsh}/bin/zsh"; };

      colors = {
        primary = {
          background = "#282828";
          foreground = "#ebdbb2";
        };
        # Normal colors
        normal = {
          black =  "#282828";
          red =    "#cc241d";
          green =  "#98971a";
          yellow = "#d79921";
          blue =   "#458588";
          magenta ="#b16286";
          cyan =   "#689d6a";
          white =  "#ebdbb2";
        };

        # Bright colors
        bright = {
          black =  "#928374";
          red =    "#fb4934";
          green =  "#b8bb26";
          yellow = "#fabd2f";
          blue =   "#83a598";
          magenta ="#d3869b";
          cyan =   "#8ec07c";
          white =  "#ebdbb2";
        };
      };
    };
  };
}