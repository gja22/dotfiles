-- Configure Fugitive
-- https://github.com/tpope/vim-fugitive

-- vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[G]it [S]tatus' })
vim.keymap.set('n', '<leader>gs', ':Git<cr> :only<cr>', { desc = '[G]it [S]tatus' })
