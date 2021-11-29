" Plugins-Related configuration options
" ----------------------------------------------------------------------------
" Better Whitespace
" ----------------------------------------------------------------------------
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

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

" ----------------------------------------------------------------------------
" Telescope.nvim remappings
" ----------------------------------------------------------------------------
nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
