local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup LSP Config
require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
	on_attach = function() 
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0}) -- Map the hover function to "K" in normal mode only for this buffer
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0}) -- "gd" = go to definition, "ctrl-t" = go back to where you were
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0}) 
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0}) 
    vim.keymap.set('n', ' dp', vim.diagnostic.goto_prev, {buffer=0}) -- previous error
    vim.keymap.set('n', ' df', vim.diagnostic.goto_next, {buffer=0}) -- next error
    vim.keymap.set('n', ' r', vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set('n', 'ca', vim.lsp.buf.code_action, {buffer=0})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
	end,
}

vim.opt.completeopt={"menu", "menuone", "noselect"}

-- Setup nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Setup Telescope
require('telescope').setup{
  defaults = {
    prompt_prefix = "> "
  }
}

vim.keymap.set('n', ' ff', ':Telescope find_files<cr>')

-- Global Mapping
vim.keymap.set('n', ' n', ':bn<cr>')
