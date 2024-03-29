-- Core completion engine
-- https://github.com/hrsh7th/nvim-cmp
return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- snippet engine
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets
					-- This step is not supported in many windows environments
					-- Remove the below condition to re-enable on windows
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
						end,
					},
				},
			},
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			{
				"onsails/lspkind.nvim",
				config = function()
					require("lspkind").init()
				end,
			},
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})
			local kind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				---@diagnostic disable-next-line: missing-fields
				formatting = {
					format = function(entry, vim_item)
						vim_item.kind = kind.presets.default[vim_item.kind] .. " " .. vim_item.kind
						-- vim_item.kind = kind.presets.default[vim_item.kind]
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							path = "[Path]",
						})[entry.source.name]
						return vim_item
					end,
				},

				mapping = cmp.mapping.preset.insert({
					-- ["<C-n>"] = cmp.mapping.select_next_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					-- ["<C-p>"] = cmp.mapping.select_prev_item(),
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-Space>"] = cmp.mapping.complete({}),
					["C-y"] = cmp.mapping.confirm({
						-- behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-l>"] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
}
-- ["<Tab>"] = cmp.mapping(function(fallback)
-- this is old from when I was overloading the tab key
-- this single function for a key is much better
-- 	if cmp.visible() then
-- 		cmp.select_next_item()
-- 	elseif luasnip.expand_or_locally_jumpable() then
-- 		luasnip.expand_or_jump()
-- 	else
-- 		fallback()
-- 	end
--
-- ["<S-=Tab>"] = cmp.mapping(function(fallback)
-- if cmp.visible() then
-- 	cmp.select_prev_item()
-- elseif luasnip.locally_jumpable(-1) then
-- 	luasnip.jump(-1)
-- else
-- 	fallback()
-- end
-- end, { "i", "s" }),
