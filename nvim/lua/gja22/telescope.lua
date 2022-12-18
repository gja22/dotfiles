-- Check if telescope is installed
local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<Down>"] = require('telescope.actions').cycle_history_next,
        ["<Up>"] = require('telescope.actions').cycle_history_prev,
        -- C-n for next is available by default
        -- ["<C-j>"] = actions.move_selection_next,
        -- C-p for previous is available by default
        -- ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
}

-- Telescope Keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[b] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>ss', function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep initial fileset > ") })
end, { desc = '[S]earch [S]ubset, grep initial fileset' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Use `C-q` within Telescope to write diagnostics to the quickfix list
-- keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)

