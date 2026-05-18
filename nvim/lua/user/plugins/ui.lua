pcall(function()
	require("lualine").setup({
		options = {
			theme = "auto",
			globalstatus = true,
			section_separators = "",
			component_separators = "",
		},
	})
end)

pcall(function()
	require("gitsigns").setup({
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	})
end)

pcall(function()
	require("nvim-tree").setup({
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
	})
end)

pcall(function()
	require("which-key").setup()
end)

pcall(function()
	require("ibl").setup()
end)
