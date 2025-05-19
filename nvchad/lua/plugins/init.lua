return {
	{ "nvim-lua/plenary.nvim" },
	{
		"hrsh7th/nvim-cmp",
		opts = function()
			local config = require("nvchad.configs.cmp")
			config.mapping["<CR>"] = nil
			return config
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		opts = require("configs.conform"),
	},

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
				"python",
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
			lazy = false,
			cmd = {
				"TmuxNavigateLeft",
				"TmuxNavigateRight",
				"TmuxNavigateUp",
				"TmuxNavigateDown",
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
