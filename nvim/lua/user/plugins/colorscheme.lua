return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		lazy = false,
		config = function()
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					require("user.themes.dracowl").apply()
				end,
			})
		end,
	},
	{
		"LazyVim/LazyVim",
		opts = { colorscheme = "catppuccin-mocha" },
	},
}
