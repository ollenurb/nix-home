{ config, pkgs, ... }:

{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        geometry = "500x6-14+44";
	frame_color = "#282828";
	font = "Iosevka Nerd Font 12";
	word_wrap = true;
	markup = true;
	format = "<b>%s</b>\n%b";
	alignment = "left";
	shrink = false;
	padding = 8;
	horizontal_padding = 10;
	max_icon_size = 80;
      };

      urgency_low = {
        background = "#83a598";
        foreground = "#282828";
	timeout = 10;
      };

      urgency_normal = {
        background = "#83a598";
        foreground = "#282828";
	timeout = 10;
      };

      urgency_critical = {
        background = "#cc241d";
        foreground = "#928374";
	timeout = 0;
      };

    };

  };

}
