-- https://github.com/nvim-telescope/telescope.nvim
return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			require("telescope").setup({
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

							["<Down>"] = require("telescope.actions").cycle_history_next,
							["<Up>"] = require("telescope.actions").cycle_history_prev,
							["<C-j>"] = require("telescope.actions").move_selection_next,
							["<C-k>"] = require("telescope.actions").move_selection_previous,
							["<C-u>"] = false,
							["<C-d>"] = false,
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
				},
			})

			-- Load extensions
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("ui-select")

			-- Telescope keymaps
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Find Keymaps" })
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fz", function()
				require("telescope.builtin").find_files({ find_command = { "rg", "--files", "--sort", "path" } })
				-- require("telescope.builtin").find_files({ find_command = { "fd", "-tf" } })
			end, { desc = "Find Zettel" })
			vim.keymap.set("n", "<leader>ft", builtin.builtin, { desc = "Find Select Telescope" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Find current Word" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find by Grep" })
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostics" })
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Find Resume" })
			vim.keymap.set("n", "<leader>f.", builtin.oldfiles, { desc = "Find Recent" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Search Buffers" })

			vim.keymap.set("n", "<leader>/", function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Find in current buffer" })

			vim.keymap.set("n", "<leader>f/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "Find in Open Files" })

			-- Shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Find Neovim files" })

			vim.keymap.set("n", "<leader>fv", builtin.git_files, { desc = "Find Version Control Files" })
			vim.keymap.set("n", "<leader>fc", builtin.git_status, { desc = "Find Changes" })
		end,
	},
}
