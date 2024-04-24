return {
	"lunarvim/darkplus.nvim",
	"gruvbox-community/gruvbox",
	"Tsuzat/NeoSolarized.nvim",
	"navarasu/onedark.nvim",
	"rose-pine/neovim",
	"sainnhe/sonokai",
	"rebelot/kanagawa.nvim",
	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("tokyonight-night")
		end,
	},
}
