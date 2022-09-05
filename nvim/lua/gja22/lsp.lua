-- LSP Setup

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "gopls" }
})

local keymap = vim.keymap.set
-- buffer 0 is the current buffer
local opts = { buffer = 0, silent = false }

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").gopls.setup{
  capabilities = capabilities,

  on_attach = function()
    keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
    keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
    keymap("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    keymap("n", "gt", function() vim.lsp.buf.type_definition() end, opts)
    keymap("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    keymap("n", "gr", function() vim.lsp.buf.references() end, opts)
    keymap("n", "gl", function() vim.diagnostic.open_float() end, opts)

    keymap("n", "<leader>lf", function() vim.lsp.buf.formatting() end, opts)
    keymap("n", "<leader>li", "<cmd>LspInfo<CR>", opts)
    keymap("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
    keymap("n", "<leader>lj", function() vim.diagnostic.goto_next() end, opts)
    keymap("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, opts)
    keymap("n", "<leader>lr", function() vim.lsp.buf.rename() end, opts)
    keymap("n", "<leader>ls", function() vim.lsp.buf.signature_help() end, opts)
    keymap("n", "<leader>lq", function() vim.diagnostic.setqflist() end, opts)
  end,
}

require'lspconfig'.sumneko_lua.setup {
  capabilities = capabilities,

  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
