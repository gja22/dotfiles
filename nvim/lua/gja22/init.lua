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

-- Gitsigns configuration
require("gja22.gitsigns")

-- Illuminate configuration
require("gja22.illuminate")

-- Status line configuration
require("gja22.lualine")

-- Color Scheme configuration
require("gja22.colorscheme")

-- Key mappings configuration
require("gja22.keymaps")

-- LSP configuration
require("gja22.lsp")

-- Telescope configuration
require("gja22.telescope")

-- Autopairs configuration
require("gja22.autopairs")

-- Comment configuration
require("gja22.comment")

-- Completion configuration
require("gja22.cmp")

-- Luasnip configuration
-- require("gja22.luasnip")
require("gja22.snippets")
