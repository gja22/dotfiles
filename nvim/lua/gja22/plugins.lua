-- Packer configuration
local packer = require("packer")

packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end
    },
})

-- The use parameter is not technically required, but it prevents
-- a bunch of warning messages. I don't get the nuance, but the details
-- are here https://github.com/wbthomason/packer.nvim/issues/243
return packer.startup(function(use)
    -- experimenting with my own plugin
    use("~/gja22/capture.nvim")

    use("wbthomason/packer.nvim")

    -- Plenary provides commonly used Lua functions
    use("nvim-lua/plenary.nvim")

    -- Popup is used by a few other plugins if available
    -- will likely be part of core neovim in the future
    use("nvim-lua/popup.nvim")

    -- Telescope is a fuzzy finder
    use("nvim-telescope/telescope.nvim")

    -- Harpoon is, well, harpoon
    use { "ThePrimeagen/harpoon" }

    -- Netrw wrapper
    use { "tpope/vim-vinegar" }

    -- Convenience Mappings
    use { "tpope/vim-unimpaired" }
    use { "tpope/vim-surround" }

    -- Autopairs, integrates with both cmp and treesitter
    use { "windwp/nvim-autopairs" }

    -- Indent Blankline visually displays grouped code
    use { "lukas-reineke/indent-blankline.nvim" }

    -- Illuminate, show matches to word under cursor
    use { "RRethy/vim-illuminate" }

    -- Lualine is a status line plugin
    use { "nvim-lualine/lualine.nvim" }

    -- Devicons for a few plugins
    use { "kyazdani42/nvim-web-devicons" }

    -- Color Schemes
    use { "folke/tokyonight.nvim" }
    use { "lunarvim/darkplus.nvim" }
    use { "gruvbox-community/gruvbox" }
    use { "Tsuzat/NeoSolarized.nvim" }

    -- Comments
    use { "numToStr/Comment.nvim" }

    -- LSP
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "onsails/lspkind-nvim" }

    -- Completions
    use { "hrsh7th/nvim-cmp" } -- core completion engine
    use { "hrsh7th/cmp-buffer" } -- buffer completions
    use { "hrsh7th/cmp-path" } -- path completions
    use { "hrsh7th/cmp-nvim-lua" } -- neovim lua knowledge (e.g. apis)
    use { "hrsh7th/cmp-nvim-lsp" } -- integration with lsp
    use { "saadparwaiz1/cmp_luasnip" } -- snippet completions

    -- Snippets
    use { "L3MON4D3/LuaSnip" } -- snippet engine

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    -- Git related
    use { "lewis6991/gitsigns.nvim" }
    use { "tpope/vim-fugitive" }

end)
