local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"

telescope.setup {
  defaults = {

    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },
    file_ignore_patterns = { ".git/", "node_modules" },

    mappings = {
      i = {
        ["<Down>"] = actions.cycle_history_next,
        ["<Up>"] = actions.cycle_history_prev,
        -- C-n for next is available by default
        -- ["<C-j>"] = actions.move_selection_next,
        -- C-p for previous is available by default
        -- ["<C-k>"] = actions.move_selection_previous,
      },
    },
  },
}
