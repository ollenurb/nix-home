{ config, lib, pkgs, stdenv, ... }:

let
  defaultPkgs = with pkgs; [
    htop				                      # better top
    killall                 		      # kill all processes
    duf                     		      # disk usage/free utility
    fd                      		      # "find" for files
    exa                      		      # a better ls
    libnotify               		      # notify-send command
    nix-doc                 		      # nix documentation search tool
    pavucontrol             		      # pulseaudio control
    firefox                 		      # browser
    pandoc                            # Documents generator
    texlive.combined.scheme-full      # LaTeX
    spotify                           # Music player
    rofi-power-menu                   # Power menu
    feh                               # Image viewer
    maim                              # Screeshot taker
    tdesktop                          # Telegram
    discord                           # discord 
    element-desktop                   # Matrix client
    gnumake                           # Make utility
  ];

  haskellPkgs = with pkgs.haskellPackages; [
    brittany                # code formatter
    cabal-install           # cabal
    ghc                     # compiler
  ];
in {
  home = {
    username = "matteo";
    homeDirectory = "/home/matteo";
    packages = defaultPkgs ++ haskellPkgs;
    sessionVariables = {
      EDITOR = "nvim";
    };
  }; 

  # Change GTK theme
  gtk = {
    enable = true;
    theme = {
      package = pkgs.gruvbox-dark-gtk;
      name = "gruvbox-dark";
    };
    iconTheme = {
      package = pkgs.gruvbox-dark-icons-gtk;
      name = "oomox-gruvbox-dark";
    };
  };

  # Doesn't work, figure out why..
  # services.betterlockscreen.enable = true;

  imports = (import ./programs);

  programs = {
    bat.enable = true;
    git = {
      enable = true;
      userName = "Ollenurb";
      userEmail = "brunello.mtt@gmail.com";
    };

    home-manager = {
      enable = true;
    };
  };
}
