-- LSP Setup

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "gopls" }
})

local keymap = vim.keymap.set
local opts = { silent = true }

require("lspconfig").gopls.setup{
  on_attach = function()
    keymap("n", "gd", function() vim.lsp.buf.definition() end, opts)
    keymap("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    keymap("n", "K", function() vim.lsp.buf.hover() end, opts)
    keymap("n", "gr", function() vim.lsp.buf.references() end, opts)
    keymap("n", "<leader>lf", function() vim.lsp.buf.formatting() end, opts)
  end,
}

require'lspconfig'.sumneko_lua.setup {
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
