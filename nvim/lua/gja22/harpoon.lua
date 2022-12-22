-- Check if harpoon is installed
local status_ok, _ = pcall(require, 'harpoon')
if not status_ok then
  return
end

local mark = require('harpoon.mark')
local ui = require('harpoon.ui')

-- Harpoon keymaps
vim.keymap.set("n", "<leader>h", mark.add_file, { desc = '[H]arpoon add file' })
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = '[E]dit Harpoon files' })
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = 'Harpoon file 1' })
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end, { desc = 'Harpoon file 2' })
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end, { desc = 'Harpoon file 3' })
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end, { desc = 'Harpoon file 4' })
