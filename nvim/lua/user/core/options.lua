local opt = vim.opt

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.wrap = false
opt.breakindent = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.expandtab = true
opt.autoindent = true
opt.termguicolors = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.clipboard = "unnamedplus"
opt.completeopt = { "menu", "menuone", "noselect" }
opt.undofile = true
opt.swapfile = false
opt.cursorline = true

vim.diagnostic.config({
	virtual_text = {
		spacing = 2,
		source = "if_many",
	},
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
})
