-- LSP Setup
-- https://github.com/neovim/nvim-lspconfig

-- Diagnostic keymaps
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Goto next diagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Goto previous diagnostic message' })
vim.keymap.set('n', 'gq', vim.diagnostic.setloclist, { desc = 'Goto quickfix/diagnostics list' })
vim.keymap.set('n', 'gw', vim.diagnostic.open_float, { desc = 'Goto diagnostic/error window' })
vim.keymap.set('n', 'ge', require('telescope.builtin').diagnostics, { desc = "Goto project errors/diagnostics" })

-- Diagnostic styling
vim.diagnostic.config {
    float = {
        source = 'always',
        border = 'rounded',
    },
}

-- This function gets run when an LSP connects to a particular buffer
local on_attach = function(_, bufnr)
    -- Helper fucntion to define mappings
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('<leader>cf', ':Format<cr>', '[C]ode [F]ormat')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>as', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[A]ll [S]ymbols')
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- This clashes with Harpoon and I rarely use it
    -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')

    -- Lesser used LSP functionality
    -- nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    -- nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    --   nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    -- nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    -- nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    -- nmap('<leader>wl', function()
    --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--local servers = { 'sumneko_lua', 'gopls' }
local servers = {
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            diagnostics = { globals = { "vim" }, },
        },
    },
    gopls = {},
    terraformls = {},
    cssls = {},
    html = {},
    tsserver = {},
}


-- Setup neovim lua configuration
require('neodev').setup()

-- Setup mason so it can manage external tooling
require('mason').setup()

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers)
}

-- I don't get why the diagnostic border is a simle config option, but with
-- hover and signature help that I need to do this. I'm guessing this will
-- all get sorted out in future neovim releases.
local border = {
    { "┌", "FloatBorder" },
    { "─", "FloatBorder" },
    { "┐", "FloatBorder" },
    { "│", "FloatBorder" },
    { "┘", "FloatBorder" },
    { "─", "FloatBorder" },
    { "└", "FloatBorder" },
    { "│", "FloatBorder" },
}

-- LSP settings (for overriding per client)
local handlers = {
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
            handlers = handlers,
        }
    end
}

-- Turn on LSP status information
require('fidget').setup()

-- Custom configuration for Lua
-- Make runtime files discoverable to server
-- local runtime_path = vim.split(package.path, ';')
-- table.insert(runtime_path, 'lua/?.lua')
-- table.insert(runtime_path, 'lua/?/init.lua')
