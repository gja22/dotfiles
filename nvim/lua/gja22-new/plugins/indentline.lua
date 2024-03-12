-- https://github.com/lukas-reineke/indent-blankline.nvim
-- When confused try :help ibl.config
return {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
        exclude = {
            filetypes = { 'markdown' },
        },
        scope = {
            enabled = false,
        },
        indent = {
            -- Easiest way to get chars to use
            -- https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/doc/indent_blankline.txt
            char = '▏',
        },
    },
    config = function()
        vim.keymap.set('n', '<leader>i', '<cmd>IBLToggle<cr>', { silent = true, desc = 'Toggle Indentline display', })
    end
}
