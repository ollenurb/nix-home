{ config, lib, pkgs, stdenv, ... }:

let
  defaultPkgs = with pkgs; [
    htop				                      # better top
    killall                 		      # kill all processes
    duf                     		      # disk usage/free utility
    fd                      		      # "find" for files
    fzf                               # fuzzy finder
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
    flameshot                         # Screeshot taker
    tdesktop                          # Telegram
    discord                           # discord
    element-desktop                   # Matrix client
    gnumake                           # Make utility
    anki                              # Spaced-repetition program
    mpv                               # Video Player
    zathura                           # .pdf viewer
    betterlockscreen                  # lockscreen
    ripgrep                           # faster grep

    # ---------- Uni-related stuff ---------- #
    protege-distribution

  ];

  haskellPkgs = with pkgs.haskellPackages; [
    brittany                          # code formatter
    cabal-install                     # cabal
    ghc                               # compiler
    haskell-language-server           # hls
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

  imports = (import ./programs) ++ (import ./shell);

  programs = {
    bat.enable = true;
    git = {
      enable = true;
      userName = "Ollenurb";
      userEmail = "brunello.mtt@gmail.com";
      extraConfig = {
        core.editor = "nvim";
        init.defaultBranch = "main";
      };
    };

    home-manager = {
      enable = true;
    };
  };
}
