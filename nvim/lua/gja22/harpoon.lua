-- Check if harpoon is installed
local status_ok, _ = pcall(require, 'harpoon')
if not status_ok then
  return
end

-- Harpoon keymaps
vim.keymap.set("n", "<leader>a", function() require("harpoon.mark").add_file() end, { desc = '' })
vim.keymap.set("n", "<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, { desc = '' })
vim.keymap.set("n", "<C-h>", function() require("harpoon.ui").nav_file(1) end, { desc = '' })
vim.keymap.set("n", "<C-j>", function() require("harpoon.ui").nav_file(2) end, { desc = '' })
vim.keymap.set("n", "<C-k>", function() require("harpoon.ui").nav_file(3) end, { desc = '' })
vim.keymap.set("n", "<C-l>", function() require("harpoon.ui").nav_file(4) end, { desc = '' })
