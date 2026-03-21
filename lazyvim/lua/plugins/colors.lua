return {
	{
		"Mofiqul/dracula.nvim",
		name = "dracula",
		priority = 1000,
		config = function()
			require("dracula").setup({
				transparent_bg = false,
				show_end_of_buffer = false,
				italic_comment = true,
				colors = {
					bg = "#030c1b",
					fg = "#cccccc",
					selection = "#264f78",
					comment = "#7f848e",
					red = "#fb5474",
					orange = "#fbe179",
					yellow = "#fbe179",
					green = "#66ffb4",
					purple = "#a179fb",
					cyan = "#9cdcfe",
					pink = "#fc60a1",
					menu = "#000815",
					visual = "#264f78",
					gutter_fg = "#3f4a63",
					nontext = "#192234",
					white = "#cccccc",
					black = "#030c1b",
				},
			})
			vim.cmd("colorscheme dracula")

			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000815" })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#a179fb", bg = "#000815" })
			vim.api.nvim_set_hl(0, "LineNr", { fg = "#3f4a63" })
			vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#a179fb", bold = true })
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
	},
}
