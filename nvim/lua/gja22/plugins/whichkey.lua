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
			["<leader>s"] = { name = "Search", _ = "which_key_ignore" },
			["<leader>t"] = { name = "Toggle", _ = "which_key_ignore" },
			["<leader>z"] = { name = "Zettel", _ = "which_key_ignore" },
		})
	end,
}
