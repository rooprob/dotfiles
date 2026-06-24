local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable",
		"https://github.com/folke/lazy.nvim.git", lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ "LazyVim/LazyVim", import = "lazyvim.plugins" },
		{ import = "user.plugins" },
		{ import = "user.lang" },
	},
	defaults = { lazy = false, version = false },
	change_detection = { notify = false },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip", "matchit", "matchparen", "netrwPlugin",
				"tarPlugin", "tohtml", "tutor", "zipPlugin",
			},
		},
	},
})
