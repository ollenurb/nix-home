{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    # Setup custom aliases
    shellAliases = {
      apply-system = "$HOME/.dotfiles/apply-system.sh";
      apply-home = "$HOME/.dotfiles/apply-home.sh";
      options-nixos = "man configuration.nix";
      options-home = "man home-configuration.nix";
      ls = "ls --color=auto";
      l = "exa -l --icons";
      # Build only the changed wiki files
      w2h = ''
        git status --short |
        awk '{print $2}' |
        awk -F. 'match($NF, "md"){print substr($0, 0, length($0) - 3)}' |
        xargs -I {} -n1 pandoc "{}.md" --mathjax -d wiki.yaml -o "{}.html"
      '';
      # Build the entire wiki
      w0h = ''
       find . -iname "*.md" -type f -exec sh -c 'pandoc "''${0}" --mathjax -d wiki.yaml -o "''${0%.md}.html" ' {} \;
      '';
      grep = "${pkgs.ripgrep}/bin/rg";
      fcd = "cd ''$(${pkgs.fd}/bin/fd --type d | ${pkgs.fzf}/bin/fzf)";
    };
    # Setup custom prompt
    initExtra = ''
        PROMPT="%B%F{blue}λ%f %F{244}%f %F{cyan}%1~%f%b "

    '';
    # Add plugins
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.4.0";
          sha256 = "037wz9fqmx0ngcwl9az55fgkipb745rymznxnssr3rx9irb6apzg";
        };
      }
    ];

  };
}
