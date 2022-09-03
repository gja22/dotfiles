-- Load Lua modules during initialization

-- Vim options
require("gja22.options")

-- Use packer to load plugins
require("gja22.plugins")

-- Status line configuration
require("gja22.lualine")

-- Color Scheme
require("gja22.colorscheme")

-- Key mappings
require("gja22.keymaps")

-- LSP
require("gja22.lsp")

-- Completion
require("gja22.cmp")

-- Autopairs
require("gja22.autopairs")
