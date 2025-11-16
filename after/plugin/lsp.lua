local lsp = require("lsp-zero")

lsp.extend_lspconfig()  -- replaces lsp.preset("recommended")

-- ensure servers are installed
require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'rust_analyzer',
    },
    handlers = {
        lsp.default_setup,
    },
})

local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
  ['<C-e>'] = cmp.mapping.complete(),
})

-- Disable completion with tab
--cmp_mappings['<Tab>'] = nil
--cmp_mappings['<S-Tab>'] = nil

-- lsp.setup_nvim_cmp() HAS BEEN REMOVED in lsp-zero v3+
-- so replace it with a direct cmp.setup() call
cmp.setup({
  mapping = cmp_mappings,
  sources = cmp.config.sources({
      { name = 'nvim_lsp' },
  }, {
      { name = 'buffer' },
  })
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

-- keymaps
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

-- diagnostics
vim.diagnostic.config({
    virtual_text = true
})

