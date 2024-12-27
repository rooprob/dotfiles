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
	{
		"stevearc/conform.nvim",
		event = "BufWritePre", -- uncomment for format on save
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
			"alexghergh/nvim-tmux-navigation",
			config = function()
				local nvim_tmux_nav = require("nvim-tmux-navigation")

				nvim_tmux_nav.setup({
					disable_when_zoomed = true, -- defaults to false
				})

				vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
				vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
				vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
				vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
				vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
				vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
			end,
		},
		--		{
		--			"christoomey/vim-tmux-navigator",
		--			cmd = {
		--				"TmuxNavigateLeft",
		--				"TmuxNavigateRight",
		--				"TmuxNavigateUp",
		--				"TmuxNavigateDown",
		--			},
		--			keys = {
		--				{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
		--				{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
		--				{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
		--				{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		--				{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		--			},
		--		},
		--
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
