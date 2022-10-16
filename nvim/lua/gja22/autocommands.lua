-- Experimenting
-- local group = vim.api.nvim_create_augroup("Madge", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Madge'", group = group })
-- vim.api.nvim_create_autocmd("BufEnter", { command = "echo 'Geoff'", group = group, buffer = 0 })

-- Format go code on save
local gogroup = vim.api.nvim_create_augroup("GoGroup", { clear = true })

-- vim.api.nvim_create_autocmd("BufWritePre",
--   {group = gogroup,
--    pattern = { "*.go", },
--    command = "echo 'Yeah Baby'"}
-- )

-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR> 
      set nobuflisted 
    ]]
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    print("setting up markdown NOWRAP")
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Fixes Autocomment
-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
--   callback = function()
--     vim.cmd "set formatoptions-=cro"
--   end,
-- })

-- Highlight Yanked Text
-- vim.api.nvim_create_autocmd({ "TextYankPost" }, {
--   callback = function()
--     vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
--   end,
-- })
