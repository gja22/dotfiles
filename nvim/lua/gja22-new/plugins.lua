local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    { import = 'gja22-new.plugins' },
    {
        "folke/neodev.nvim",
        opts = {},
    },
    "nvim-lua/plenary.nvim",
    "nvim-lua/popup.nvim",
    "nvim-tree/nvim-web-devicons",

    -- "lukas-reineke/indent-blankline.nvim",

    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "j-hui/fidget.nvim",
                tag = "legacy",
            },
        },
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",                 -- Core completion engine
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",         -- integration with lspplugi
            "L3MON4D3/LuaSnip",             -- snippet engine
            "saadparwaiz1/cmp_luasnip",     -- snippet completions
            "rafamadriz/friendly-snippets", -- adds some friendly snippets
        },
    },
    -- use { "hrsh7th/cmp-buffer" } -- buffer completions
    -- use { "hrsh7th/cmp-path" } -- path completions
    -- use { "hrsh7th/cmp-nvim-lua" } -- neovim lua knowledge (e.g. apis)

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html" },
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end
    },

    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = "nvim-treesitter",
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },

    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },

    "ThePrimeagen/harpoon",

    -- Autopairs, integrates with both cmp and treesitter
    -- "windwp/nvim-autopairs",

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },

})
