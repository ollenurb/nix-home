" Plugins-Related configuration options
" ----------------------------------------------------------------------------
" Better Whitespace
" ----------------------------------------------------------------------------
let g:better_whitespace_enabled=1

" ----------------------------------------------------------------------------
" Airline settings
" ----------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1

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
