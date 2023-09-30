-- Telescope configuration

require("telescope").setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        file_ignore_patterns = { ".git/", "node_modules" },

        mappings = {
            i = {
                -- Useful Telescope commands that are built in
                -- Use `C-q` write diagnostics to the quickfix list
                -- Use `C-p` previous item in list
                -- Use `C-n` next item in list

                ["<Down>"] = require('telescope.actions').cycle_history_next,
                ["<Up>"] = require('telescope.actions').cycle_history_prev,
                -- C-n for next is available by default
                ["<C-j>"] = require('telescope.actions').move_selection_next,
                -- C-p for previous is available by default
                ["<C-k>"] = require('telescope.actions').move_selection_previous,
                ["<C-u>"] = false,
                ["<C-d>"] = false,
            },
        },
    },
}

-- Load extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

-- Telescope Keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch [W]ord under cursor' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<cr>', { desc = '[F]ile [B]rowser', noremap = true, })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>gc', require('telescope.builtin').git_status, { desc = '[G]it [C]hanges' })
