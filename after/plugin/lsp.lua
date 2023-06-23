local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'bashls',
  'clangd',
  'cmake',
  'csharp_ls',
  'eslint',
  'pyright',
  'rust_analyzer',
  'solargraph',
  'svelte',
  'tailwindcss',
  'tsserver',
})

lsp.nvim_workspace()

local cmp = require('cmp')
local cmp_select = { behaviior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<C-Cr>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
  suggest_lsp_servers = false,
  sign_icons = {
    error = 'E',
    warn = 'W',
    hint = 'H',
    info = 'I'
  }
})

lsp.setup()

vim.diagnostic.config({
  virtual_text = true
})
