-- nvim options

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true                       -- ignore case when searching
vim.opt.smartcase = true
vim.opt.hlsearch = false
-- :set hlsearch! to toggle within nvim

-- Display
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.termguicolors = true                    -- allow 24-bit RGB colors in the TUI
vim.opt.guicursor = "a:block"                   -- block cursor in all modes
vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = false                  -- no relative numbering
vim.opt.colorcolumn = "80"                      -- visually indicate line width
vim.opt.signcolumn = "yes"                      -- show sign column (errors, etc.)
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.linebreak = true                        -- split on whitespace, no broken words
vim.opt.showmatch = true                        -- show matching brackets
vim.opt.showmode = true                         -- show INSERT, VISUAL, etc. mode on command line
vim.opt.showcmd = true                          -- show active command on the command line
vim.opt.scrolloff = 3                           -- lines above/below when scrolling
vim.opt.sidescrolloff = 3
vim.opt.cmdheight = 2                           -- more space for displaying messages
-- can not get lishchars working
vim.opt.lcs = { tab = '+', trail = '+', nbsp = '+', eol = '⤶', extends = '+', precedes = '+' }

-- Backup
vim.opt.swapfile = false                        -- no swapfile
vim.opt.backup = false                          -- no backup file
--vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.backupdir = "~/.vim/backup"
vim.opt.directory = "~/.vim/swp"
vim.opt.undodir = "~/.vim/undo"

-- Save and quit
vim.opt.hidden = true                           -- don't force buffer saves

-- Tabs and indenting
-- set backspace=indent,eol,start               -- from old config, not sure if still needed
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.softtabstop = 2                         -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation

-- Warnings
vim.opt.errorbells = false                      -- turn off audio bell
vim.opt.visualbell = false                      -- leave on visual bell

-- Windows
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window


vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.mouse = "a"                             -- allow the mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showtabline = 0                         -- always show tabs
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
vim.opt.laststatus = 3
vim.opt.ruler = false
vim.opt.numberwidth = 4                         -- set number column width to 2 {default 4}
--vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.fillchars.eob=" "
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")

