local nmap = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end

return {
	"gja22/capture.nvim",
	config = function()
		nmap("<leader>zo", function()
			require("capture").oneonone()
		end, "Zettel 1-1")
		nmap("<leader>zm", function()
			require("capture").meeting()
		end, "Zettel meeting")
		nmap("<leader>zn", function()
			require("capture").note()
		end, "Zettel note")
		nmap("<leader>zd", function()
			require("capture").daily()
		end, "Zettel daily")
		nmap("<leader>zw", function()
			require("capture").weekly()
		end, "Zettel weekly")
	end,
}
