-- https://github.com/lewis6991/gitsigns.nvim
return {
	"lewis6991/gitsigns.nvim",
	opts = {
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
			untracked = { text = "┆" },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map("n", "]h", function()
				if vim.wo.diff then
					return "]h"
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Next Hunk" })

			map("n", "[h", function()
				if vim.wo.diff then
					return "[h"
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return "<Ignore>"
			end, { expr = true, desc = "Prev Hunk" })

			-- Actions
			-- map('n', '<leader>hs', gs.stage_hunk)
			map("n", "<leader>hr", gs.reset_hunk, { desc = "Hunk Reset (Git)" })
			-- map('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
			-- map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
			-- map('n', '<leader>hS', gs.stage_buffer)
			-- map('n', '<leader>hu', gs.undo_stage_hunk)
			map("n", "<leader>hR", gs.reset_buffer, { desc = "Hunk Reset All (Git)" })
			map("n", "<leader>hp", gs.preview_hunk, { desc = "Hunk Preview (Git)" })
			map("n", "<leader>hb", function()
				gs.blame_line({ full = true })
			end, { desc = "Hunk Blame (Git)" })
			-- map('n', '<leader>tb', gs.toggle_current_line_blame)
			map("n", "<leader>hd", gs.diffthis, { desc = "Hunk Diff This (Git)" })
			map("n", "<leader>hD", function()
				gs.diffthis("~")
			end, { desc = "Hunk Diff File (Git)" })
			-- map('n', '<leader>td', gs.toggle_deleted)

			-- Text object
			-- map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
		end,
	},
}
