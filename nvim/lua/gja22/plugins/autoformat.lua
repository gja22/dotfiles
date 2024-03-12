-- https://github.com/stevearc/conform.nvim
return { -- Autoformat
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			go = { "goimports", "gofmt" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettierd", "prettier" } },
		},
	},
}
