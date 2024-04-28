vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.vim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


local opts = {
    colorscheme = "falcon",
}

require("lazy").setup("plugins", opts)

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})

local configs = require("nvim-treesitter.configs")
configs.setup({
    insure_installed = {"lua", "javascript", "python"},
    highlight = { enable = true },
    indent = { enable = true} ,
})

vim.cmd.colorscheme "falcon"
