-- https://github.com/ThePrimeagen/harpoon
return {
	"ThePrimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<C-h>", mark.add_file, { desc = "Harpoon a file" })
		vim.keymap.set("n", "<C-j>", ui.toggle_quick_menu, { desc = "Harpoon file list" })
		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end, { desc = "Harpoon file 1" })
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end, { desc = "Harpoon file 2" })
		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end, { desc = "Harpoon file 3" })
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end, { desc = "Harpoon file 4" })
		vim.keymap.set("n", "<leader>5", function()
			ui.nav_file(5)
		end, { desc = "Harpoon file 5" })
	end,
}
