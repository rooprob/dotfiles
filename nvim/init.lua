vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

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

local plugins = {
	{ "fenetikm/falcon", name = "falcon", priority = 1000 },
}
local opts = {}

require("lazy").setup(plugins, opts)
vim.cmd.colorscheme "falcon"
