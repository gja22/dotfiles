-- Indent_blankline configuration
--
-- Remember, when confused try :help ibl.config

require('ibl').setup {
    exclude = {
        filetypes = { 'markdown' },
    },
    scope = {
        enabled = false,
    },
    indent = {
        -- Easiest way to get chars
        -- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/doc/indent_blankline.txt
        char = '▏',
    },
}

-- Toogle indentline display, sometimes it's just too much
vim.keymap.set("n", "<leader>i", '<cmd>IBLToggle<cr>', { silent = true, desc = 'Toggle Indentline display', })
