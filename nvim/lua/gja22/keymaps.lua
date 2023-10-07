-- Shorten function name
local nmap = function(keys, func, desc)
    vim.keymap.set('n', keys, func, { desc = desc,} )
end

--Space as my leader key
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
nmap("<leader>w", ":w<cr>", 'Write file')
nmap("<leader>q", ":q<cr>", 'Quit')

-- Toggle of numbering
nmap("<leader>r", ":set relativenumber!<CR>", 'Toggle relativenumber')
nmap("<leader>n", ":set number!<CR>", 'Toggle number')

-- Toggle listchars
nmap("<leader>v", ":set list!<CR>", 'Toggle listchars')

-- Windows
-- fast window creation
nmap("<leader><Right>", "<C-w>v", 'Create window to the right')
nmap("<leader><Down>", "<C-w>s", 'Create window below')
-- close current window
nmap("<leader>c", ":close<cr>", 'Close window')
-- close other windows
nmap("<leader>o", ":only<cr>", 'Only window')
-- make all windows equal size
nmap("<leader>=", "<C-w>=", 'Make windows the same size')
-- increase height of window
nmap("<leader><Up>", "<C-w>5+", 'Make window taller')
-- increase width of window
nmap("<leader><Left>", "<C-w>5>", 'Make window wider')
-- use arrows for window navigation
nmap("<Left>", "<C-w>h", 'Move to window to the left')
nmap("<Down>", "<C-w>j", 'Move to window below')
nmap("<Up>", "<C-w>k", 'Move to window above')
nmap("<Right>", "<C-w>l", 'Move to window to the right')

-- Clear search highlighting
-- Conflicts with search buffers
-- keymap("<leader><Space>", ":nohlsearch<CR>", 'Clear search highlighting')

-- Navigation
-- move cursor line to center of screen when scrolling down and up
nmap("<C-d>", "<C-d>zz", 'Scroll down and center')
nmap("<C-u>", "<C-u>zz", 'Scroll up and center')
-- move cursor line to center of screen when jumping to next search
nmap("n", "nzz", 'Find next and center')
nmap("N", "Nzz", 'Find prev and center')

-- Writing
-- Redraw long lines to stay within width
nmap("<leader>d", "gqip", 'Redraw long lines')

-- Close buffers
--keymap("<S-q>", "<cmd>Bdelete!<CR>", opts)

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
-- keymap("<leader>e", ":NvimTreeToggle<CR>", opts)

-- My own plugin experiment
nmap("<leader>zo", function() require("capture").oneonone() end, 'Zettel 1-1')
nmap("<leader>zm", function() require("capture").meeting() end, 'Zettel neeting')
nmap("<leader>zn", function() require("capture").note() end, 'Zettel note')
nmap("<leader>zd", function() require("capture").daily() end, 'Zettel daily')
nmap("<leader>zw", function() require("capture").weekly() end, 'Zettel weekly')

-- Undo Tree
nmap("<leader>u", vim.cmd.UndotreeToggle, 'Toggle Undotree')
