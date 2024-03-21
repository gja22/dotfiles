-- various plugins to support nvim tools
return {
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup()
		end,
	},
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup()
		end,
	},
	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",
	"nvim-tree/nvim-web-devicons",
}
