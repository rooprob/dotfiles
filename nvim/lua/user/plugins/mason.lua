return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = { border = "rounded" },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "eslint", "ts_ls" },
			automatic_enable = false,
		},
	},
}
