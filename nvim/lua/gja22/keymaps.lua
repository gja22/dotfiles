-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = false }

--Remap space as leader key
--keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal = "n",
--   insert = "i",
--   visual = "v",
--   visual_block = "x",
--   term = "t",
--   command = "c",

-- NORMAL MODE MAPPINGS --

-- Save and quit
keymap("n", "<leader>w", ":w<CR>", opts)
-- keymap("n", "<leader>q", ":q<CR>", opts)

-- Easy toggling of numbering
keymap("n", "<leader>r", ":set relativenumber!<CR>", opts)
keymap("n", "<leader>n", ":set number!<CR>", opts)

-- Toggle listchars
keymap("n", "<leader>v", ":set list!<CR>", opts)

-- Windows
-- fast window creation
keymap("n", "<leader><Right>", "<C-w>v", opts)
keymap("n", "<leader><Down>", "<C-w>s", opts)
-- close current window
keymap("n", "<leader>c", ":close<CR>", opts)
-- close other windows
keymap("n", "<leader>o", ":only<CR>", opts)
-- make all windows equal size
keymap("n", "<leader>=", "<C-w>=", opts)
-- increase height of window
keymap("n", "<leader><Up>", "<C-w>5+", opts)
-- increase width of window
keymap("n", "<leader><Left>", "<C-w>5>", opts)
-- use arrows for window navigation
keymap("n", "<Left>", "<C-w>h", opts)
keymap("n", "<Down>", "<C-w>j", opts)
keymap("n", "<Up>", "<C-w>k", opts)
keymap("n", "<Right>", "<C-w>l", opts)

-- Clear search highlighting
-- keymap("n", "<leader><Space>", ":nohlsearch<CR>", opts)

-- Navigation
-- move cursor line to center of screen when scrolling down and up
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
-- move cursor line to center of screen when jumping to next search
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Writing
-- Redraw long lines to stay within width
keymap("n", "<leader>d", "gqip", opts)

-- Close buffers
--keymap("n", "<S-q>", "<cmd>Bdelete!<CR>", opts)

-- Better paste
--keymap("v", "p", '"_dP', opts)

-- INSERT MODE MAPPINGS --
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- PLUGIN MAPPINGS --

-- NvimTree
-- keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- My own plugin experiment
keymap("n", "<leader>zo", function() require("capture").oneonone() end, opts)
keymap("n", "<leader>zm", function() require("capture").meeting() end, opts)
keymap("n", "<leader>zn", function() require("capture").note() end, opts)
keymap("n", "<leader>zd", function() require("capture").daily() end, opts)
keymap("n", "<leader>zw", function() require("capture").weekly() end, opts)

-- Undo Tree
keymap("n", "<leader>u", vim.cmd.UndotreeToggle, opts)

-- Git
--keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

-- Comment
-- keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

-- DAP
--keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
--keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
--keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
--keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
--keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
--keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
--keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
--keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
--keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
