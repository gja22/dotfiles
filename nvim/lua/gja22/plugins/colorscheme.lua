return {
	-- 'folke/tokyonight.nvim',
	-- 'lunarvim/darkplus.nvim',
	-- 'gruvbox-community/gruvbox',
	-- 'Tsuzat/NeoSolarized.nvim',
	-- 'rose-pine/neovim',
	-- 'navarasu/onedark.nvim',
	{
		"rebelot/kanagawa.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("kanagawa-wave")
		end,
	},
}
