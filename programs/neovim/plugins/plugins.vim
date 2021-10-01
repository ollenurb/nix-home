" Plugins-Related configuration options
" ----------------------------------------------------------------------------
" Better Whitespace
" ----------------------------------------------------------------------------
let g:better_whitespace_enabled=1

" ----------------------------------------------------------------------------
" Tree sitter settings
" ----------------------------------------------------------------------------
lua << EOF
    require'nvim-treesitter.configs'.setup {
        ensure_installed = "maintained",
        highlight = {
            enable = true,
        },
    }
EOF
