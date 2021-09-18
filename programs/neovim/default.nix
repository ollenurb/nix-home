{ config, pkgs, lib, ... }:
let
  neovim-5 = pkgs.neovim-unwrapped.overrideAttrs (
    old: {
      name    = "neovim-5.0.0";
      version = "v0.5.0";

      src = pkgs.fetchFromGitHub {
        owner  = "neovim";
        repo   = "neovim";
        rev    = "a5ac2f45ff84a688a09479f357a9909d5b914294";
        sha256 = "0lgbf90sbachdag1zm9pmnlbn35964l3khs27qy4462qzpqyi9fi";
      };

      buildInputs = old.buildInputs ++ [ pkgs.tree-sitter ];
    }
  );

  # Taken from https://breuer.dev/blog/nixos-home-manager-neovim
  # installs a vim plugin from git with a given tag / branch
  pluginGit = ref: repo: pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "${lib.strings.sanitizeDerivationName repo}";
    version = ref;
    src = builtins.fetchGit {
      url = "https://github.com/${repo}.git";
      ref = ref;
    };
  };

  # always installs latest version
  plugin = pluginGit "HEAD";
in
{
  programs.neovim = {
    enable       = true;
    withPython3  = true; # for plugins
    vimAlias = true;
    viAlias = true;
    package = neovim-5;

    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./base.vim)
      (lib.strings.fileContents ./plugins.vim)
      (lib.strings.fileContents ./lsp.vim)
    ];

    extraPackages = with pkgs; [
      tree-sitter
    ];


    # install needed binaries here
    # extraPackages = with pkgs; [
      # installs different langauge servers for neovim-lsp
      # metals
    # ];

    plugins = with pkgs.vimPlugins; [
      # Language Server Protocol - Related
      (plugin "neovim/nvim-lspconfig")
      (plugin "hrsh7th/nvim-compe")

      # Syntax highlighting/language-specific
      (plugin "p00f/nvim-ts-rainbow")
      (plugin "nvim-treesitter/nvim-treesitter")
      (plugin "LnL7/vim-nix")
      (plugin "vim-latex/vim-latex")
      (plugin "plasticboy/vim-markdown")

      # Misc
      (plugin "Raimondi/delimitMate") # auto bracket
      (plugin "tpope/vim-commentary")
      (plugin "tpope/vim-fugitive")
      (plugin "godlygeek/tabular")
      (plugin "vimwiki/vimwiki")
      (plugin "ntpeters/vim-better-whitespace")

      # EyeCandies
      (plugin "morhetz/gruvbox")
      (plugin "vim-airline/vim-airline")
      (plugin "ryanoasis/vim-devicons")
    ];
  };
}
