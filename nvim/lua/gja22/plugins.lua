-- Packer configuration

return require("packer").startup(function()
  use("wbthomason/packer.nvim")

  -- Plenary provides commonly used Lua functions
  use("nvim-lua/plenary.nvim")

  -- Popup is used by a few other plugins if available
  -- will likely be part of core neovim in the future
  use("nvim-lua/popup.nvim")

  -- Telescope is a fuzzy finder
  use("nvim-telescope/telescope.nvim")

  -- Netrw wrapper
  use { "tpope/vim-vinegar" }

  -- Convenience Mappings
  use { "tpope/vim-unimpaired" }

  -- Autopairs, integrates with both cmp and treesitter
  use { "windwp/nvim-autopairs" } 

  -- Lualine is a status line plugin
  use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    -- Color Schemes
  use { "folke/tokyonight.nvim" }
  use { "lunarvim/darkplus.nvim" }
  use { "gruvbox-community/gruvbox" }

  -- Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
        -- setup() establishes default key mappings
        -- this could be done in a seperate file for consistency
        -- but I'm leaving it for now
        require('Comment').setup()
    end
  }

  -- LSP
  use { "neovim/nvim-lspconfig" }
  use { "williamboman/mason.nvim" }
  use { "williamboman/mason-lspconfig.nvim" }

  -- Completions
  use { "hrsh7th/nvim-cmp" }         -- core completion engine 
  use { "hrsh7th/cmp-buffer" }       -- buffer completions
  use { "hrsh7th/cmp-path" }         -- path completions
  use { "hrsh7th/cmp-nvim-lua" }     -- neovim lua knowledge (e.g. apis)
  use { "hrsh7th/cmp-nvim-lsp" }     -- integration with lsp
  use { "saadparwaiz1/cmp_luasnip" } -- snippet completions

  -- Snippets
  use { "L3MON4D3/LuaSnip" } -- snippet engine

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
  })

end)