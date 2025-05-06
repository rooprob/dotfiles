-- Provides the following
--
-- Plenary is a lua module for asynchronous programming using coroutines. The library is build on native lua coroutines and libuv.
-- Telescope provides fuzzy finder over lists.
-- <leader>ff  find files
-- <leader>fw  find word in a live grep
-- <leader>fb  find buffer
-- <leader>fh  find help
-- <leader>ma  find marks
-- <leader>cm  git commits
-- <leader>gt  git status
-- NvTree provides file management, picker etc.
-- <leader>e to open with focus NvimTreeFocus
-- C-n to NvTreeToggle-
-- CellularAutomaton provides a fun visualization
-- make_it_rain, game_of_life, scramble
-- WhichKey provides a helpful reminder for your mappings.
-- :checkhealth which-key
-- <leader>wK
-- <leader>wk
--
return {
	{ "nvim-lua/plenary.nvim" },
	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},
	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},
	"nvzone/volt",
	"nvzone/menu",
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform"),
	},

	-- These are some examples, uncomment them if you want to see them work!
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"css",
				"go",
				"json",
				"html",
				"lua",
				"vim",
				"vimdoc",
			},
		},

		{
			"nvim-telescope/telescope.vim",
			enabled = false,
		},
		-- Provides selector with vim keys navigation
		{
			"ibhagwan/fzf-lua",
		},
		-- Provides keyboard navigation integration with tmux
		{
			"christoomey/vim-tmux-navigator",
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateRight",
				"TmuxNavigateUp",
				"TmuxNavigateDown",
			},
			keys = {
				{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
				{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
				{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
				{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
				{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
			},
		},

		-- Provides a buffer for undo
		{
			"jiaoshijie/undotree",
			dependencies = "nvim-lua/plenary.nvim",
			config = true,
			keys = { -- load the plugin only when using it's keybinding:
				{ "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
			},
		},
		--
		-- Provides a fun visualization
		-- :CellularAutomaton make_it_rain, game_of_life, scramble
		{
			"eandrju/cellular-automaton.nvim",
			keys = {

				{ "<leader>.", "<cmd>:CellularAutomaton game_of_life<cr>" },
				{ "<leader>,", "<cmd>:CellularAutomaton scramble<cr>" },
			},
		},
	},
}
