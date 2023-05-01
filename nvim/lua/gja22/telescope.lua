-- Check if telescope is installed
local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "truncate" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<Down>"] = require('telescope.actions').cycle_history_next,
        ["<Up>"] = require('telescope.actions').cycle_history_prev,
        -- C-n for next is available by default
        ["<C-j>"] = require('telescope.actions').move_selection_next,
        -- C-p for previous is available by default
        ["<C-k>"] = require('telescope.actions').move_selection_previous,
      },
    },
  },
}

-- Load extensions
require('telescope').load_extension('fzf')
require('telescope').load_extension('file_browser')

-- Telescope Keymaps
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind [G]rep' })
vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<cr>', { desc = '[F]ile [B]rowser', noremap = true, })
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, { desc = '[B]uffers' })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').git_status, {desc = '[F]ind [C]hanges' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind [W]ord under cursor' })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fr', require('telescope.builtin').oldfiles, { desc = '[F]ind [R]ecent' })
vim.keymap.set('n', '<leader>fs', function()
    require('telescope.builtin').grep_string({ search = vim.fn.input("Grep initial fileset > ") })
end, { desc = '[F]ind [S]ubset, grep initial fileset' })
vim.keymap.set('n', '<leader>/', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Useful Telescope commands that are built in
-- Use `C-q` write diagnostics to the quickfix list
-- Use `C-p` previous item in list
-- Use `C-n` next item in list

-- keymap("n", "<leader>fr", ":Telescope lsp_references<CR>", opts)

