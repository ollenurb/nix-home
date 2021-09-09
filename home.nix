{ config, lib, pkgs, stdenv, ... }:

let
  defaultPkgs = with pkgs; [
    killall                 # kill all processes
    duf                     # disk usage/free utility
    fd                      # "find" for files
    exa                     # a better ls
    libnotify               # notify-send command
    nix-doc                 # nix documentation search tool
    pavucontrol             # pulseaudio control
    firefox                 		# seriously?
    pandoc 		    		# To create LaTeX files
    texlive.combined.scheme-full
    spotify
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
