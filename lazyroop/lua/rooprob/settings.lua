-- fat cursor
vim.opt.guicursor = ""

-- relative line numbers
vim.opt.nu = true
vim.opt.rnu = true

-- 4 space indents
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.tabstop = 4

vim.opt.wrap = true

-- long running undos.
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- interval for writing swap file to disk, also used by gitsigns
vim.opt.updatetime = 250

-- do not like term highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"

vim.opt.updatetime = 250
vim.opt.colorcolumn = "80"
