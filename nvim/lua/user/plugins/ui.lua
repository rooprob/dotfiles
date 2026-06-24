return {
	{
		"folke/which-key.nvim",
		opts = {
			spec = {
				{ "<leader>b", group = "buffers" },
				{ "<leader>c", group = "code" },
				{ "<leader>f", group = "find" },
				{ "<leader>n", group = "node/nix" },
				{ "<leader>o", group = "odin" },
				{ "<leader>p", group = "python" },
				{ "<leader>r", group = "rename" },
				{ "<leader>x", group = "diagnostics" },
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},
}
