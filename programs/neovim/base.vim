" ----------------------------------------------------------------------------
" Basic stuff
" ----------------------------------------------------------------------------
filetype plugin on
syntax on
colorscheme gruvbox-material
set noswapfile
set noshowmode
set ignorecase
set encoding=utf-8
set number
set termguicolors
set hidden
set nobackup
set smartcase
set mouse=a
set tabstop=2 softtabstop=0 expandtab shiftwidth=4 smarttab
let mapleader=" "
" MaxWidth on markdown files
au BufNewFile,BufRead *.md
    \ set textwidth=80
