-- https://github.com/mbbill/undotree
return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>tu", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })
	end,
}
