local lspconfig = require'lspconfig'
local util = require 'lspconfig.util'

-- Setup Haskell language server
lspconfig.hls.setup {
    root_dir = util.root_pattern('*.hs','*.cabal', 'stack.yaml', 'cabal.project', 'package.yaml', 'hie.yaml')
}

