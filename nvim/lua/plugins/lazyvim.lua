return {
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		keys = {
			{ "<leader>e", "<cmd>Neotree float<cr>" },
		},
	},
	{
		"akinsho/toggleterm.nvim",
		config = true,
		cmd = "ToggleTerm",
		build = ":ToggleTerm",
		keys = {
			{ "<leader>th", "<cmd>ToggleTerm count=1<cr>", desc = "Horizontal Terminal (cwd)" },
		},
		opts = {
			direction = "horizontal",
			shade_filetypes = {},
			hide_numbers = true,
			insert_mappings = true,
			start_in_insert = true,
			terminal_mappings = true,
			close_on_exit = true,
		},
	},
	{ "folke/flash.nvim", enabled = false }, -- disable search labels
}
