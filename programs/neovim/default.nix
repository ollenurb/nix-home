{ config, pkgs, lib, ... }:
let
  # taken from https://breuer.dev/blog/nixos-home-manager-neovim
  # installs a vim plugin from git with a given tag / branch
  pluginGit = ref: repo: pkgs.vimutils.buildvimpluginfrom2nix {
    pname = "${lib.strings.sanitizederivationname repo}";
    version = ref;
    src = builtins.fetchgit {
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

    # Configurations are stored in separate files
    extraConfig = builtins.concatStringsSep "\n" [
      (lib.strings.fileContents ./base.vim)
      (lib.strings.fileContents ./plugins/plugins.vim)
      ''
        lua << EOF
        ${lib.strings.fileContents ./lsp.lua}
        ${lib.strings.fileContents ./plugins/lualine.lua}
        ${lib.strings.fileContents ./plugins/bufferline.lua}
        ${lib.strings.fileContents ./plugins/cmp-nvim.lua}
        EOF
      ''
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
      cmp-nvim-lsp
      cmp-buffer
      cmp-path
      cmp-cmdline
      nvim-cmp
      neoformat

      # Syntax highlighting/language-specific
      nvim-ts-rainbow
      nvim-treesitter
      vim-nix
      vim-markdown

      # Fuzzy Finder
      telescope-nvim

      # Misc
      delimitMate # auto bracket
      vim-commentary
      vim-fugitive
      tabular
      vimwiki
      vim-better-whitespace
      toggleterm-nvim
      vim-gitgutter

      # EyeCandies
      gruvbox-material
      nvim-web-devicons
      lualine-nvim
      bufferline-nvim
    ];
  };
}
