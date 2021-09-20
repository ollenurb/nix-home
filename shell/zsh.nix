{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    shellAliases = {
      apply-system = "$HOME/.dotfiles/apply-system.sh";
      apply-home = "$HOME/.dotfiles/apply-home.sh";
      options-nixos = "man configuration.nix";
      options-home = "man home-configuration.nix";
      ls = "ls --color=auto";
      l = "exa -l --icons";
    };
    initExtra = ''
        PROMPT="%B%F{blue}λ%f %F{244}%f %F{cyan}%1~%f%b "
    '';
  };
}
