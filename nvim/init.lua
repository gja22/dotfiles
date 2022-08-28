-- Base nvim configuration file
-- Inspired by https://github.com/LunarVim/nvim-basic-ide

require "user.options"
require "user.keymaps"
require "user.plugins"
require "user.autocommands"
require "user.colorscheme"
require "user.cmp"           -- completion
require "user.telescope"
require "user.treesitter"
require "user.autopairs"
require "user.comment"
require "user.gitsigns"
--require "user.nvim-tree"
--require "user.bufferline"    -- tab like bufferline at the top
require "user.lualine"       -- status line   
-- require "user.toggleterm"
require "user.project"
--require "user.impatient"
require "user.illuminate"
require "user.indentline"
--require "user.alpha"
require "user.lsp"
--require "user.dap"
