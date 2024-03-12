-- https://github.com/ThePrimeagen/harpoon
return {
    'ThePrimeagen/harpoon',
    config = function()
        local mark = require('harpoon.mark')
        local ui = require('harpoon.ui')

        vim.keymap.set("n", "<leader>h", mark.add_file, { desc = '[H]arpoon file' })
        vim.keymap.set("n", "<leader>l", ui.toggle_quick_menu, { desc = '[L]ist Harpoon files' })
        vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = 'Harpoon file 1' })
        vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end, { desc = 'Harpoon file 2' })
        vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end, { desc = 'Harpoon file 3' })
        vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end, { desc = 'Harpoon file 4' })
    end
}
