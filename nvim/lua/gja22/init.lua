-- Load Lua modules during initialization

-- Useful stuff when writing plugins
require 'gja22.globals'

-- Vim options
require 'gja22.options'

-- Use packer to load plugins
require 'gja22.plugins'

-- Autocommands
require 'gja22.autocommands'
require 'gja22.keymaps'     -- Key mappings

-- Plugin Configuration
require 'gja22.indentline'  -- Indent blankline
require 'gja22.gitsigns'    -- Gitsigns
require 'gja22.lualine'     -- Lualine
require 'gja22.colorscheme' -- Colorscheme
require 'gja22.treesitter'  -- Treesitter
require 'gja22.lsp'         -- LSP
require 'gja22.cmp'         -- Completion
require 'gja22.telescope'   -- Telescope
require 'gja22.harpoon'     -- Harpoon
require 'gja22.fugitive'    -- Fugitive
require 'gja22.autopairs'   -- Autopairs
require 'gja22.comment'     -- Comment

-- My snippets
require 'gja22.snippets'
