-- https://github.com/folke/which-key.nvim
return {
	"folke/which-key.nvim",
	event = "VimEnter",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration at the above URL
	},
	config = function()
		require("which-key").setup()
		require("which-key").register({
			["<leader>c"] = { name = "Code", _ = "which_key_ignore" },
			["<leader>f"] = { name = "Find", _ = "which_key_ignore" },
			["<leader>h"] = { name = "Hunk", _ = "which_key_ignore" },
			["<leader>g"] = { name = "Git", _ = "which_key_ignore" },
			["<leader>t"] = { name = "Toggle", _ = "which_key_ignore" },
			["<leader>z"] = { name = "Zettel", _ = "which_key_ignore" },
		})
	end,
}
