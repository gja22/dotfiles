-- https://github.com/tpope/vim-fugitive
return {
	"tpope/vim-vinegar",
	"tpope/vim-unimpaired",
	"tpope/vim-surround",
	"tpope/vim-rhubarb",
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", ":Git<cr> :only<cr>", { desc = "[G]it [S]tatus" })
		end,
	},
}
