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
    { import = 'gja22-new.plugins.colorscheme' },
    { import = 'gja22-new.plugins.tpope-goodness' },
    { import = 'gja22-new.plugins.cmp' },
    { import = 'gja22-new.plugins.comment' },
    { import = 'gja22-new.plugins.gitsigns' },
    { import = 'gja22-new.plugins.harpoon' },
    { import = 'gja22-new.plugins.indentline' },
    { import = 'gja22-new.plugins.lualine' },
    { import = 'gja22-new.plugins.support' },
    { import = 'gja22-new.plugins.telescope' },
    { import = 'gja22-new.plugins.treesitter' },
    { import = 'gja22-new.plugins.undotree' },
    { import = 'gja22-new.plugins.whichkey' },

     {
         'neovim/nvim-lspconfig',
         dependencies = {
             'williamboman/mason.nvim',
             'williamboman/mason-lspconfig.nvim',
             'folke/neodev.nvim',
             {
                 'j-hui/fidget.nvim',
                 tag = 'legacy',
             },
         },
     },

})
