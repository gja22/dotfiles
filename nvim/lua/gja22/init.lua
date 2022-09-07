-- Load Lua modules during initialization

-- Useful stuff when writing plugins
require("gja22.globals")

-- Vim options
require("gja22.options")

-- Use packer to load plugins
require("gja22.plugins")

-- Autocommands
require("gja22.autocommands")

-- Indent Blankline configuration
require("gja22.indentline")

-- Status line configuration
require("gja22.lualine")

-- Color Scheme configuration
-- require("gja22.colorscheme")

-- Key mappings configuration
require("gja22.keymaps")

-- LSP configuration
require("gja22.lsp")

-- Completion configuration
-- require("gja22.cmp")

-- Autopairs configuration
require("gja22.autopairs")

-- Comment configuration
-- require("gja22.comment")

-- Luasnip configuration
-- require("gja22.luasnip")
-- require("gja22.snippets")
