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
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Search Help" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "Search Keymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Search Files" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "Search Select Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "Search current Word" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Search by Grep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "Search Diagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "Search Resume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = "Search Recent Files" })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Search Buffers" })

			vim.keymap.set("n", "<leader>/", function()
				require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "Search in current buffer" })

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "Search in Open Files" })

			-- Shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "Search Neovim files" })

			vim.keymap.set("n", "<leader>sv", builtin.git_files, { desc = "Search Version Control Files" })
			vim.keymap.set("n", "<leader>sc", builtin.git_status, { desc = "Search Changes" })
		end,
	},
}
