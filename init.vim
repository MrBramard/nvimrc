syntax on
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab

call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/cmp_luasnip'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Themes
Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim', {'name':'dracula'}

call plug#end()

lua require('bramard-config')

colorscheme dracula
