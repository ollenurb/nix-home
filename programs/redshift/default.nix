{ config, pkgs, ... }:

{
  services.redshift = {
    enable = true;
    latitude = 45.464825;
    longitude = 7.903443;
  };
}
