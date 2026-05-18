local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
	local url = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", url, lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
	},
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",
	"nvim-lualine/lualine.nvim",
	"nvim-tree/nvim-web-devicons",
	"folke/which-key.nvim",
	"lukas-reineke/indent-blankline.nvim",
	"nvim-tree/nvim-tree.lua",
	"numToStr/Comment.nvim",
	"windwp/nvim-autopairs",
	"stevearc/conform.nvim",
	"mfussenegger/nvim-lint",
	"NvChad/base46",
	"NvChad/ui",
}, {
	change_detection = {
		notify = false,
	},
	install = {
		colorscheme = { "catppuccin" },
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
})
