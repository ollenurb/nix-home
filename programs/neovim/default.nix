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
      buildInputs = old.buildInputs ++ [
        pkgs.tree-sitter
      ];
    }
  );

  # Taken from https://breuer.dev/blog/nixos-home-manager-neovim
  # Installs a vim plugin from git with a given tag / branch
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
    enable      = true;
    withPython3 = true; # for plugins
    vimAlias    = true;
    viAlias     = true;
    package     = neovim-5;

    # Configurations are stored in separate files
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./base.vim)
      (lib.strings.fileContents ./plugins.vim)
      (lib.strings.fileContents ./lsp.vim)
    ];

    # Some packages required to run plugins
    extraPackages = with pkgs; [
      tree-sitter
      gcc
      nodejs
    ];

    # Fetch plugins from pkgs or git using the (plugin) function
    plugins = with pkgs.vimPlugins; [
      # Language Server Protocol - Related
      nvim-lspconfig
      nvim-compe

      # Syntax highlighting/language-specific
      nvim-ts-rainbow
      nvim-treesitter
      vim-nix
      vim-latex-live-preview
      vim-markdown

      # Misc
      delimitMate # auto bracket
      vim-commentary
      vim-fugitive
      tabular
      vimwiki
      vim-better-whitespace

      # EyeCandies
      gruvbox
      vim-airline
      vim-airline-themes
      vim-devicons

      # Python
      vim-slime
      (plugin "hanschen/vim-ipython-cell")
    ];
  };
}
