-- Packer configuration
local packer = require('packer')

packer.init({
    display = {
        open_fn = function()
            return require('packer.util').float { border = 'rounded' }
        end
    },
})

-- The use parameter is not technically required, but it prevents
-- a bunch of warning messages. I don't get the nuance, but the details
-- are here https://github.com/wbthomason/packer.nvim/issues/243
return packer.startup(function(use)
    -- experimenting with my own plugin
    use '~/gja22/capture.nvim'

    -- Package manager
    use 'wbthomason/packer.nvim'

    -- Plenary provides commonly used Lua functions
    use('nvim-lua/plenary.nvim')

    -- Popup is used by a few other plugins if available
    -- will likely be part of core neovim in the future
    use('nvim-lua/popup.nvim')

    -- LSP configuration & plugins
    use { 'neovim/nvim-lspconfig',
        requires = {
            -- Autoinstall LSPs to standard path
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            -- Useful status updates for LSP
            'j-hui/fidget.nvim',
        },
    }

    -- Autocompletion
    use { 'hrsh7th/nvim-cmp',           -- Core completion engine
        requires = {
            'hrsh7th/cmp-nvim-lsp',     -- integration with lsp
            'L3MON4D3/LuaSnip',         -- snippet engine
            'saadparwaiz1/cmp_luasnip', -- snippet completions
        },
    }
    -- use { "hrsh7th/cmp-buffer" } -- buffer completions
    -- use { "hrsh7th/cmp-path" } -- path completions
    -- use { "hrsh7th/cmp-nvim-lua" } -- neovim lua knowledge (e.g. apis)

    -- Treesitter (highlight, edit, and navigate code)
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            pcall(require('nvim-treesitter.install').update { with_sync = true })
        end,
    }

    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    -- Git related
    use 'tpope/vim-fugitive'
    use 'tpope/vim-rhubarb'
    use 'lewis6991/gitsigns.nvim'

    -- Telescope is a fuzzy finder
    use { 'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            'nvim-telescope/telescope-file-browser.nvim',
        }
    }

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
    -- use { "RRethy/vim-illuminate" }

    -- Status line
    use { 'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    -- Devicons for a few plugins
    use { 'nvim-tree/nvim-web-devicons' }

    -- Color Schemes
    use { "folke/tokyonight.nvim" }
    use { "lunarvim/darkplus.nvim" }
    use { "gruvbox-community/gruvbox" }
    use { "Tsuzat/NeoSolarized.nvim" }
    use { "rose-pine/neovim" }
    use { "navarasu/onedark.nvim" }
    use { "rebelot/kanagawa.nvim" }

    -- Comments
    use 'numToStr/Comment.nvim'
end)
